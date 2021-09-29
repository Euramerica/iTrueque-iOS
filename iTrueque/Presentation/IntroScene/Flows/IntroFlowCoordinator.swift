//
//  IntroFlowCoordinator.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 27/9/21.
//

import UIKit

protocol IntroFlowCoordinatorDependencies {
    func makeIntroViewController() -> UIViewController
}

final class IntroFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: IntroFlowCoordinatorDependencies
    
    private var introView: IntroView?
    
    init(navigationController: UINavigationController,
         dependencies: IntroFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let viewController = dependencies.makeIntroViewController()
        navigationController?.pushViewController(viewController, animated: false)
    }
    
}
