//
//  AppDIContainer.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    func makeSplashSceneDIContainer() -> SplashSceneDIContainer {
        let dependencies = SplashSceneDIContainer.Dependencies()
        return SplashSceneDIContainer(dependencies: dependencies)
    }
    
    func makeIntroSceneDIContainer() -> IntroSceneDIContainer {
        let dependencies = IntroSceneDIContainer.Dependencies()
        return IntroSceneDIContainer(dependencies: dependencies)
    }
    
    func makeTabBarSceneDIContainer() -> TabBarSceneDIContainer {
        let dependencies = TabBarSceneDIContainer.Dependencies()
        return TabBarSceneDIContainer(dependencies: dependencies)
    }
}
