//
//  RemoteDataManager.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation


/// Conform this protocol to all remote API requests
protocol RemoteDataManager {
    func fetchAll<T: Remotable>(completion: @escaping (Result<T, Error>) -> ())
    func add<T: Remotable>(completion: @escaping (Result<T, Error>) -> ())
    func update<T: Remotable>(completion: @escaping (Result<T, Error>) -> ())
    func delete<T: Remotable>(completion: @escaping (Result<T, Error>) -> ())
}
