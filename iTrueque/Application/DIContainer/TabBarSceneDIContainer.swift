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
    func makeTabBarViewController() -> UIViewController {
        let view = TabBarView()
        return UIHostingController(rootView: view)
    }
    
    // MARK: - Flow Coordinators
    func makeTabBarFlowCoordinator(navigationController: UINavigationController) -> TabBarFlowCoordinator {
        return TabBarFlowCoordinator(navigationController: navigationController,
                                     dependencies: self)
    }
    
}

extension TabBarSceneDIContainer: TabBarFlowCoordinatorDependencies {}
