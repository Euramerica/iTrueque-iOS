//
//  UserAuthenticationRepository.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 4/10/21.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserAuthenticationRepository {
    
    private let keyChainDataSource = KeyChainDataSource()
    
    private let db = Firestore.firestore()
    
    func getStoredLogin() -> AnyPublisher<StoredLogin ,Error> {
        keyChainDataSource.getStoredLogin()
            .eraseToAnyPublisher()
    }
    
    func storeLogin(_ user: UserApp) ->AnyPublisher<Void, Error> {
        keyChainDataSource.storeLogin(user)
            .eraseToAnyPublisher()
    }
    
    func removeStoredLogin() -> AnyPublisher<Void, Error> {
        keyChainDataSource.removeStoredLogin()
            .eraseToAnyPublisher()
    }
   
    func doLogin(email: String, password: String) -> AnyPublisher<UserApp, Error> {
        Deferred {
            Future<UserApp, Error> { promise in
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        return promise(.failure(error))
                    } else if let email = result?.user.email, let uid = result?.user.uid {
                        let userApp = UserApp(uid: uid, name: "", surname: "", email: email, password: password)
                        return promise(.success(userApp))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func createUser(name: String, surname: String, email: String, password: String) -> AnyPublisher<UserApp, Error> {
        Deferred{
            Future<UserApp, Error>{ promise in
//                let userApp = UserApp(email: email, password: password)
//                return promise(.success(userApp))
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        return promise(.failure(error))
                    } else if let email = result?.user.email, let uid = result?.user.uid {
                        let userApp = UserApp(uid: uid, name: name, surname: surname, email: email, password: password)
                        return promise(.success(userApp))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func createUserDatabase(user: UserApp) -> AnyPublisher<UserApp, Error> {
        Deferred{
            Future<UserApp, Error>{ [weak self] promise in
                
                self?.db.collection("user").document().setData([
                    "name": user.name,
                    "surname": user.surname,
                    "email": user.email,
                    "uid": user.uid
                ]) { error in
                    if let error = error {
                        return promise(.failure(error))
                    } else {
                        return promise(.success(user))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
    
}
