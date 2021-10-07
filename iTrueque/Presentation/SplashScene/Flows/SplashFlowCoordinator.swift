//
//  SplashFlowCoordinator.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 3/10/21.
//

import UIKit

protocol SplashFlowCoordinatorDependencies {
    func makeSplashViewController(coordinatorActions: SplashViewModelActions) -> UIViewController
    func makeIntroViewController() -> UIViewController
    func makeHomeViewController() -> UIViewController
}

final class SplashFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: SplashFlowCoordinatorDependencies
    
    private var splashView: SplashView?
    
    init(navigationController: UINavigationController,
         dependencies: SplashFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let coordinatorActions = SplashViewModelActions(showIntro: showIntroScene, showHome: showHomeScene)
        let viewController = dependencies.makeSplashViewController(coordinatorActions: coordinatorActions)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    private func showIntroScene() {
        let viewController = dependencies.makeIntroViewController()
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
    private func showHomeScene() {
        let viewController = dependencies.makeHomeViewController()
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
}
