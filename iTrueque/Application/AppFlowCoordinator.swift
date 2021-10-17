//
//  AppFlowCoordinator.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        navigationController.navigationBar.isHidden = true
        let splashSceneDIContainer = appDIContainer.makeSplashSceneDIContainer()
        let flow = splashSceneDIContainer.makeSplashFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
