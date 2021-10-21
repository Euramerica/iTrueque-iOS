//
//  ProfileViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 15/10/21.
//

import Combine
import SwiftUI

struct ProfileState {
    var dataState: ModelDataState = .idle
    var user: UserApp = UserApp(id: "", uid: "", name: "", surname: "", email: "", password: "", avatar: "")
    
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}

enum ProfileAction {
    case logout
    case goToIntro
    case getProfileData
    case onAppear
}

class ProfileViewModel: ViewModel {
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let removeStoredLogin = RemoveStoredLogin()
    private let coordinatorActions: TabBarViewModelActions?
    private let getProfileData = GetProfileData()
    
    @Published
    var state: ProfileState
    
    init(state: ProfileState,
         coordinatorActions: TabBarViewModelActions? = nil) {
        self.state = state
        self.coordinatorActions = coordinatorActions
        self.state.changeViewModelState(newViewModelState: .loading)
    }
    
    func handle(_ action: ProfileAction) {
        switch action {
        case .onAppear:
            self.handle(.getProfileData)
            
        case .logout:
            removeStoredLogin.execute()
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("logout finished")
                        self?.handle(.goToIntro)
                    case .failure(_):
                        print("logout failures")
                    }
                } receiveValue: {
                    print("logout receive")
                }
                .store(in: &cancellableSet)
            
        case .goToIntro:
            coordinatorActions?.showIntro()
            
        case .getProfileData:
            getProfileData.execute()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getProfileData finished")
                    case .failure(let error):
                        print(error)
                    }
                } receiveValue: { [weak self] user in
                    self?.state.user = user
                }
                .store(in: &cancellableSet)
        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}
