//
//  RemoteDataManager.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation


protocol RemoteDataManager {
    func fetchAll()
    func getById(_ id: Identifier)
    func update(_ id: Identifier)
    func delete(_ id: Identifier)
}
