//
//  GenreCollectionRepository.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 19/10/21.
//

import Combine
import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

final class GenreCollectionRepository {
    
    private let db = Firestore.firestore()
    
    func getAllGenres() -> AnyPublisher<[Genre], Error> {
        Deferred{
            Future<[Genre], Error> { [weak self] promise in
                self?.db.collection("genre")
                    .addSnapshotListener { (querySnapshot, error) in
                        if let error = error {
                            return promise(.failure(error))
                        } else {
                            var genres: [Genre] = []
                            guard let documents = querySnapshot?.documents else {
                                return promise(.success(genres))
                            }
                            
                            genres = documents.compactMap { queryDocumentSnapshot in
                                try? queryDocumentSnapshot.data(as: Genre.self)
                            }
                            
                            return promise(.success(genres))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
}
