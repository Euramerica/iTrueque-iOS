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
    
    func makeIntroViewController() -> UIViewController {
        let view = IntroView()
        return UIHostingController(rootView: view)
    }
    
    func makeIntroFlowCoordinator(navigationController: UINavigationController) -> IntroFlowCoordinator {
        return IntroFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
}

extension IntroSceneDIContainer: IntroFlowCoordinatorDependencies {}
