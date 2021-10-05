//
//  VerifyStoredLogin.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 4/10/21.
//

import Combine
import Foundation
import Firebase

public final class VerifyStoredLogin {
    private let repository = UserAuthenticationRepository()

    func execute(email: String, password: String) -> AnyPublisher<User, Error> {
        repository.doLogin(email: email, password: password)
            .eraseToAnyPublisher()

    }
}
