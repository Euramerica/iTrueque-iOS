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
    var loginToast: ToastState = .none
    
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}


enum IntroAction{
    case createNewUser(name: String, surname: String, email: String, password: String)
    case _createNewUserDatabase(user: UserApp)
    case doLogin(email: String, password: String)
    case showLogin
    case hideLogin
    case showRegister
    case hideRegister
    case goToHome
    case setLoginToast(ToastState)
}

class IntroViewModel: ViewModel{
    
    @Published
    var state: IntroState
    
    //Stored properties
    private let performLogin: PerformLogin
    private let createNewUser: CreateNewUser
    private let createNewUserDatabase = CreateNewUserDatabase()
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
        case .createNewUser(let name, let surname, email: let email, password: let password):
            createNewUser.execute(name: name, surname: surname, email: email, password: password)
                .sink { result in
                    switch result{
                    case .finished:
                        print("finish!")
                    case .failure(_):
                        print("failed!")
                    }
                } receiveValue: { [weak self] user in
                    self?.handle(._createNewUserDatabase(user: user))
                }.store(in: &cancellableSet)

        case ._createNewUserDatabase(let user):
            createNewUserDatabase.execute(user: user)
                .sink { [weak self] result in
                    switch result{
                    case .finished:
                        self?.handle(.hideRegister)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            self?.coordinatorActions?.showHome()
                        }
                    case .failure(_):
                        print("failed!")
                    }
                } receiveValue: { user in
                    print("_createNewUserDatabase - after use case")
                    print(user)
                }.store(in: &cancellableSet)

            
        
        case .doLogin(let email, let password):
            performLogin.execute(email: email, password: password)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.state.isLogin = false
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.state.loginToast = .failure(error.localizedDescription, "")
                    }
                } receiveValue: { [weak self] user in
                    if var cancellable = self?.cancellableSet {
                        self?.storeLogin.execute(user)
                            .sink { completion in
                                switch completion {
                                case .finished:
                                    break
                                case .failure(_):
                                    break
                                }
                            } receiveValue: {
                                print("logout receive")
                            }
                            .store(in: &cancellable)
                    }
                    
                    self?.handle(.hideLogin)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
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
            
        case .setLoginToast(let toast):
            state.loginToast = toast
        
        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}
