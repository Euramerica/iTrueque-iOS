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
        // In App Flow we can check if user needs to login, if yes we would run login flow
        navigationController.navigationBar.isHidden = true
        let introSceneDIContainer = appDIContainer.makeIntroSceneDIContainer()
        let flow = introSceneDIContainer.makeIntroFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
