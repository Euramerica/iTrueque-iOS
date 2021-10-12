//
//  UserStoredDataSource.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 11/10/21.
//

import Combine
import Foundation
import KeychainAccess

final class KeyChainDataSource {
    
    private let keychain = Keychain(service: "itrueque")
    
    func getStoredLogin() -> AnyPublisher<StoredLogin ,Error> {
        let storedLogin = StoredLogin(email: keychain["username"] ?? "", password: keychain["password"] ?? "" )
        return Just(storedLogin)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func storeLogin(_ user: UserApp) -> AnyPublisher<Void, Error> {
        keychain["username"] = user.email
        keychain["password"] = user.password
        return Empty()
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

