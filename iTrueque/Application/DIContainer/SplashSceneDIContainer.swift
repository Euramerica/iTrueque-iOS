//
//  SplashSceneDIContainer.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 3/10/21.
//

import Foundation
import SwiftUI

final class SplashSceneDIContainer {
    
    struct Dependencies {
        
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeSplashViewController(coordinatorActions: SplashViewModelActions) -> UIViewController {
        let getStoredLogin = GetStoredLogin()
        let verifyStoredLogin = VerifyStoredLogin()
        let viewModel = SplashViewModel(state: SplashState(), getStoredLogin: getStoredLogin, verifyStoredLogin: verifyStoredLogin, coordinatorActions: coordinatorActions)
        let view = SplashView().environmentObject(AnyViewModel(viewModel))
        return UIHostingController(rootView: view)
    }
    
    func makeIntroViewController(coordinatorActions: IntroViewModelActions) -> UIViewController {
        
        let viewModel = IntroViewModel(state: IntroState(), verifyStoredLogin: VerifyStoredLogin(), coordinatorActions: coordinatorActions)
        let view = IntroView().environmentObject(AnyViewModel(viewModel))
        return UIHostingController(rootView: view)
    }
    
    func makeHomeViewController() -> UIViewController {
        let view = TabBarView()
        return UIHostingController(rootView: view)
    }
    
    func makeSplashFlowCoordinator(navigationController: UINavigationController) -> SplashFlowCoordinator {
        return SplashFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
}

extension SplashSceneDIContainer: SplashFlowCoordinatorDependencies {
    
}
