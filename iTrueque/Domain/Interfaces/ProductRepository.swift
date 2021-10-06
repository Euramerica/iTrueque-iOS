//
//  ProductRepository.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 3/10/21.
//

import Foundation

protocol ProductRepository {
    func fetchAll() -> [Product]
    func add(this product: Product)
    func update(this product: Product)
    func delete(this product: Product)
}
