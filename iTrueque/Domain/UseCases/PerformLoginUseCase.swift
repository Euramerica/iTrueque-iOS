//
//  PerformLogin.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 4/10/21.
//

import Combine
import Foundation

public final class PerformLogin {
    private let repository = UserAuthenticationRepository()

    func execute(email: String, password: String) -> AnyPublisher<UserApp, Error> {
        repository.doLogin(email: email, password: password)
            .eraseToAnyPublisher()

    }
}
