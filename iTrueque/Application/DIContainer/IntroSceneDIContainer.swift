//
//  IntroSceneDIContainer.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 28/9/21.
//

import Foundation
import SwiftUI

final class IntroSceneDIContainer {
    
    struct Dependencies {
        
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
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
    
    func makeIntroFlowCoordinator(navigationController: UINavigationController) -> IntroFlowCoordinator {
        return IntroFlowCoordinator(navigationController: navigationController, dependencies: self)
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
}

extension IntroSceneDIContainer: IntroFlowCoordinatorDependencies {}
