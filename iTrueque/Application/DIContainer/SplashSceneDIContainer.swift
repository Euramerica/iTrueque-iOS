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
        let performLogin = PerformLogin()
        let viewModel = SplashViewModel(state: SplashState(), getStoredLogin: getStoredLogin, performLogin: performLogin, coordinatorActions: coordinatorActions)
        let view = SplashView().environmentObject(AnyViewModel(viewModel))
        return UIHostingController(rootView: view)
    }
    
    func makeIntroViewController(coordinatorActions: IntroViewModelActions) -> UIViewController {
        
        let viewModel = IntroViewModel(state: IntroState(),
                                       performLogin: PerformLogin(),
                                       createNewUser: CreateNewUser(),
                                       coordinatorActions: coordinatorActions
        )
        
        let view = IntroView().environmentObject(AnyViewModel(viewModel))
        return UIHostingController(rootView: view)
    }
    
    func makeTabBarViewController(coordinatorActions: TabBarViewModelActions) -> UIViewController {
        let profileScreenViewModel = ProfileViewModel(state: ProfileState(), coordinatorActions: coordinatorActions)
        let viewModel = TabBarViewModel(state: TabBarState(),
                                        coordinatorActions: coordinatorActions,
                                        profileScreenViewModel: profileScreenViewModel
        )
        let view = TabBarView().environmentObject(AnyViewModel(viewModel))
        return UIHostingController(rootView: view)
    }
    
    func makeSplashFlowCoordinator(navigationController: UINavigationController) -> SplashFlowCoordinator {
        return SplashFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
}

extension SplashSceneDIContainer: SplashFlowCoordinatorDependencies {
    
}
