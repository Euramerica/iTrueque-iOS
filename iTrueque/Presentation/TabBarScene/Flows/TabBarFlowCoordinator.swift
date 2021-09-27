//
//  TabBarFlowCoordinator.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import UIKit

protocol TabBarFlowCoordinatorDependencies {
    func makeTabBarViewController() -> UIViewController
}

final class TabBarFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: TabBarFlowCoordinatorDependencies
    
    private var tabBarView: TabBarView?
    
    init(navigationController: UINavigationController,
         dependencies: TabBarFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let viewController = dependencies.makeTabBarViewController()
        navigationController?.pushViewController(viewController, animated: false)
    }
}
