//
//  IntroFlowCoordinator.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 27/9/21.
//

import UIKit

protocol IntroFlowCoordinatorDependencies {
    func makeIntroViewController(coordinatorActions: IntroViewModelActions) -> UIViewController
    func makeHomeViewController()  -> UIViewController

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
        let coordinatorActions = IntroViewModelActions(showHome: showHome)
        let viewController = dependencies.makeIntroViewController(coordinatorActions: coordinatorActions)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    func showHome(){
        let viewController = dependencies.makeHomeViewController()
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
    
    
}
