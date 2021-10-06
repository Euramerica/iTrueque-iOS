//
//  ProductRepository.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ProductRepository: RemoteDataManager {
    
    
    //
    private let store = Firestore.firestore()
    
    func fetchAll<T>(completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable, T : Identifiable {
    }
    
    func add<T>(completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable, T : Identifiable {
        
    }
    
    func update<T>(completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable, T : Identifiable {
        
    }
    
    func delete<T>(completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable, T : Identifiable {
        
    }
    
    
}


