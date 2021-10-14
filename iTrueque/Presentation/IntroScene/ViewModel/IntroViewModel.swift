//
//  IntroViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 27/9/21.
//

import Combine
import SwiftUI

struct IntroViewModelActions {
    let showHome: () -> Void
}

struct IntroState {
    var dataState: ModelDataState = .idle
    var isLogin: Bool = false
    var isRegister: Bool = false
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}


enum IntroAction{
    case createNewUser(userName: String, email: String, password: String)
    case doLogin(email: String, password: String)
    case showLogin
    case hideLogin
    case showRegister
    case hideRegister
    case goToHome
}

class IntroViewModel: ViewModel{
    
    @Published
    var state: IntroState
    
    //Stored properties
    private let performLogin: PerformLogin
    private let createNewUser: CreateNewUser
    private let coordinatorActions: IntroViewModelActions?
    private let storeLogin = StoreLogin()
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(state: IntroState,
         performLogin: PerformLogin,
         createNewUser: CreateNewUser,
         coordinatorActions: IntroViewModelActions? = nil)
    {
        self.state = state
        self.performLogin = performLogin
        self.createNewUser = createNewUser
        self.coordinatorActions = coordinatorActions
        self.state.changeViewModelState(newViewModelState: .loading)
    }
    
    func handle(_ action: IntroAction) {
        switch action{
        case .createNewUser(let userName, email: let email, password: let password):
            createNewUser.execute(userName: userName, email: email, password: password)
                .sink { [weak self] result in
                    switch result{
                    case .finished:
                        self?.coordinatorActions?.showHome()
                    case .failure(_):
                        print("failed!")
                    }
                } receiveValue: { user in
                    print(user.email)
                }.store(in: &cancellableSet)

            
        
        case .doLogin(let email, let password):
            performLogin.execute(email: email, password: password)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.state.isLogin = false
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] user in
                    self?.storeLogin.execute(user)
                    self?.handle(.hideLogin)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self?.handle(.goToHome)
                    }
                    
                }
                .store(in: &cancellableSet)

        case .showLogin:
            self.state.isLogin = true
            
        case .showRegister:
            self.state.isRegister = true
            
        case .hideLogin:
            self.state.isLogin = false
            
        case .hideRegister:
            self.state.isRegister = false
        
        case .goToHome:
            coordinatorActions?.showHome()
        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}
