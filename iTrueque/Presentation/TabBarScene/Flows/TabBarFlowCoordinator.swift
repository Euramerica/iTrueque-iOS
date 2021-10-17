//
//  TabBarFlowCoordinator.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import UIKit

protocol TabBarFlowCoordinatorDependencies {
    func makeIntroViewController(coordinatorActions: IntroViewModelActions) -> UIViewController
    func makeTabBarViewController(coordinatorActions: TabBarViewModelActions) -> UIViewController
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
        let coordinatorActions = TabBarViewModelActions(showIntro: showIntro)
        let viewController = dependencies.makeTabBarViewController(coordinatorActions: coordinatorActions)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    func showHome(){
        let coordinatorActions = TabBarViewModelActions(showIntro: showIntro)
        let viewController = dependencies.makeTabBarViewController(coordinatorActions: coordinatorActions)
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
    func showIntro(){
        let coordinatorActions = IntroViewModelActions(showHome: showHome)
        let viewController = dependencies.makeIntroViewController(coordinatorActions: coordinatorActions)
        navigationController?.pushViewController(viewController, animated: false)
    }
}
