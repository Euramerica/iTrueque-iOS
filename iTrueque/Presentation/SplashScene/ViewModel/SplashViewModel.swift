//
//  SplashViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 3/10/21.
//

import UIKit
import Combine
import SwiftUI

struct SplashViewModelActions {
    let showIntro: () -> Void
    let showHome: () -> Void
}

enum ModelDataState: Equatable {
    static func == (lhs: ModelDataState, rhs: ModelDataState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
    case idle
    case loading
    case loaded
    case error(Error)
}

struct SplashState {
    var dataState: ModelDataState = .idle
    
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}

enum SplashAction {
    case checkStoredLogin
    case doLogin
}

class SplashViewModel: ViewModel {
    
    private let getStoredLogin: GetStoredLogin
    private let verifyStoredLogin: VerifyStoredLogin
    private let coordinatorActions: SplashViewModelActions?
    private var cancellableSet: Set<AnyCancellable> = []
    private var email: String = ""
    private var password: String = ""
    
    @Published
    var state: SplashState
    
    init(state: SplashState, getStoredLogin: GetStoredLogin, verifyStoredLogin: VerifyStoredLogin, coordinatorActions: SplashViewModelActions? = nil) {
        self.state = state
        self.getStoredLogin = getStoredLogin
        self.verifyStoredLogin = verifyStoredLogin
        self.coordinatorActions = coordinatorActions
        self.state.changeViewModelState(newViewModelState: .loading)
    }
    
    func handle(_ action: SplashAction) {
        switch action {
        case .checkStoredLogin:
            getStoredLogin.execute()
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { [weak self] value in
                        if(value.email.isEmpty || value.password.isEmpty){
                            self?.coordinatorActions?.showIntro()
                        } else {
                            self?.email = value.email
                            self?.password = value.password
                            self?.handle(.doLogin)
                        }
                    }
                )
                .store(in: &cancellableSet)
        
        case .doLogin:
            verifyStoredLogin.execute(email: self.email, password: self.password)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(_):
                        self?.coordinatorActions?.showIntro()
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