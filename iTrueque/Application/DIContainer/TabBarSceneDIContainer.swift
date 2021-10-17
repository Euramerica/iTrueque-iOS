//
//  TabBarSceneDIContainer.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import Foundation
import SwiftUI

final class TabBarSceneDIContainer {
    
    struct Dependencies {
        
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Tab Bar View
    func makeTabBarViewController(coordinatorActions: TabBarViewModelActions) -> UIViewController {
        let profileScreenViewModel = ProfileViewModel(state: ProfileState(), coordinatorActions: coordinatorActions)
        let viewModel = TabBarViewModel(state: TabBarState(),
                                        coordinatorActions: coordinatorActions,
                                        profileScreenViewModel: profileScreenViewModel
        )
        let view = TabBarView().environmentObject(AnyViewModel(viewModel))
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
    
    // MARK: - Flow Coordinators
    func makeTabBarFlowCoordinator(navigationController: UINavigationController) -> TabBarFlowCoordinator {
        return TabBarFlowCoordinator(navigationController: navigationController,
                                     dependencies: self)
    }
    
}

extension TabBarSceneDIContainer: TabBarFlowCoordinatorDependencies {}
