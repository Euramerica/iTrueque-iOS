//
//  IntroViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 27/9/21.
//

import Foundation
import Combine
import SwiftUI

struct IntroViewModelActions {
    let showHome: () -> Void
}

struct IntroState {
    var dataState: ModelDataState = .idle
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}


enum IntroAction{
    case createNewUser(userName: String, email: String, password: String)
    case doLogin(email: String, password: String)
}

class IntroViewModel: ViewModel{
    
    //Wrapped properties
    @State var state: IntroState
    

    //Stored properties
    private let verifyStoredLogin: VerifyStoredLogin
    private let createNewUser: CreateNewUser
    private let coordinatorActions: IntroViewModelActions?
    
    //
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(state: IntroState, verifyStoredLogin: VerifyStoredLogin, createNewUser: CreateNewUser, coordinatorActions: IntroViewModelActions? = nil) {
        
        self.state = state
        self.verifyStoredLogin = verifyStoredLogin
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

            
        
        //
        case .doLogin(let email, let password):
            verifyStoredLogin.execute(email: email, password: password)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(_):
                    print("failed!")
                    }
                } receiveValue: { [weak self] user in
                    self?.coordinatorActions?.showHome()
                }
                .store(in: &cancellableSet)

        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}
