//
//  UserCollectionRepository.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 21/10/21.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

enum CustomError: Error {
    case notCurrentUser
}

extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notCurrentUser:
            return "Not_current_user_available"
        }
    }
}

final class UserCollectionRepository {
    
    private let db = Firestore.firestore()
    
    func getProfileData() -> AnyPublisher<UserApp, Error> {
        Deferred{
            Future<UserApp, Error> { [weak self] promise in
                guard let currentUser = Auth.auth().currentUser else {
                    return promise(.failure(CustomError.notCurrentUser))
                }

                self?.db.collection("user").whereField("uid", isEqualTo: currentUser.uid)
                    .getDocuments(completion: { (querySnapshot, error) in
                        if let error = error {
                            return promise(.failure(error))
                        } else {
                            guard let documents = querySnapshot?.documents else {
                                return promise(.failure(CustomError.notCurrentUser))
                            }

                            let user = documents.compactMap { queryDocumentSnapshot in
                                try? queryDocumentSnapshot.data(as: UserApp.self)
                            }.first
                            
                            guard let user = user else {
                                return promise(.failure(CustomError.notCurrentUser))
                            }
                            
                            return promise(.success(user))
                        }
                    })
            }
        }.eraseToAnyPublisher()
        
    }
}
