//
//  UserAuthenticationRepository.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 4/10/21.
//

import Combine
import Foundation
import FirebaseAuth

final class UserAuthenticationRepository {
    
    private let keyChainDataSource = KeyChainDataSource()
    
    func getStoredLogin() -> AnyPublisher<StoredLogin ,Error> {
        keyChainDataSource.getStoredLogin()
            .eraseToAnyPublisher()
    }
    
    func storeLogin(_ user: UserApp) ->AnyPublisher<Void, Error> {
        keyChainDataSource.storeLogin(user)
            .eraseToAnyPublisher()
    }
   
    func doLogin(email: String, password: String) -> AnyPublisher<UserApp, Error> {
        Deferred {
            Future<UserApp, Error> { promise in
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        return promise(.failure(error))
                    } else if let email = result?.user.email {
                        let userApp = UserApp(email: email, password: password)
                        return promise(.success(userApp))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
