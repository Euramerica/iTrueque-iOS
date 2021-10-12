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
    
    func getStoredLogin() -> AnyPublisher<StoredLogin ,Error> {
        //valores mockeados
        //TODO: conectar con keychain para recuperar los valores
        let storedLogin = StoredLogin(email: "osvcha@gmailm.com", password: "itruequem")
        return Just(storedLogin)
            .setFailureType(to: Error.self)
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
    
    func createUser(userName: String, email: String, password: String) -> AnyPublisher<UserApp, Error> {
        Deferred{
            Future<UserApp, Error>{ promise in
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        return promise(.failure(error))
                    } else if let email = result?.user.email {
                        let userApp = UserApp(email: email, password: password)
                        return promise(.success(userApp))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
