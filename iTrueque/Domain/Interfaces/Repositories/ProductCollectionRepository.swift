//
//  ProductCollectionRepository.swift
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

final class ProductCollectionRepository {
    
    private let db = Firestore.firestore()
    
    func getLatestBooks() -> AnyPublisher<[Product], Error> {
        Deferred{
            Future<[Product], Error> { [weak self] promise in
                let productsRef = self?.db.collection("products").order(by: "createdAt", descending: true).limit(to: 15)
                
                productsRef!.getDocuments { (querySnapshot, error) in
                    if let error = error {
                        return promise(.failure(error))
                    } else {
                        var products: [Product] = []
                        guard let documents = querySnapshot?.documents else {
                            return promise(.success(products))
                        }
                        
                        products = documents.compactMap { queryDocumentSnapshot in
                            try? queryDocumentSnapshot.data(as: Product.self)
                        }
                        
                        return promise(.success(products))
                    }
                }
                    
            }
        }.eraseToAnyPublisher()
    }
    
    func getFavoritesBooks() -> AnyPublisher<[Product], Error> {
        Deferred{
            Future<[Product], Error> { [weak self] promise in
                let productsRef = self?.db.collection("products").order(by: "likes", descending: true).limit(to: 2)
                
                productsRef!.getDocuments { (querySnapshot, error) in
                    if let error = error {
                        return promise(.failure(error))
                    } else {
                        var products: [Product] = []
                        guard let documents = querySnapshot?.documents else {
                            return promise(.success(products))
                        }
                        
                        products = documents.compactMap { queryDocumentSnapshot in
                            try? queryDocumentSnapshot.data(as: Product.self)
                        }
                        
                        return promise(.success(products))
                    }
                }
                    
            }
        }.eraseToAnyPublisher()
    }
    
    func addBook(book: Product) -> AnyPublisher<Void, Error> {
        Deferred{
            Future<Void, Error>{ promise in
                
            }
        }.eraseToAnyPublisher()
    }
    
    
}
