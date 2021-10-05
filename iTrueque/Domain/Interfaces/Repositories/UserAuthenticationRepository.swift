//
//  UserAuthenticationRepository.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 4/10/21.
//

import Combine
import Foundation
import Firebase

final class UserAuthenticationRepository {
    
    func getStoredLogin() -> AnyPublisher<StoredLogin ,Error> {
        //valores mockeados
        //TODO: conectar con keychain para recuperar los valores
        let storedLogin = StoredLogin(email: "osvcha@gmail.com", password: "itrueque")
        return Just(storedLogin)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
   
    func doLogin(email: String, password: String) -> AnyPublisher<User, Error> {
        Deferred {
            Future<User, Error> { promise in
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        return promise(.failure(error))
                    } else if let user = result?.user {
                        return promise(.success(user))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
