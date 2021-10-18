//
//  GetLatestBooksUseCase.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation


public final class GetLatestBooks{
    
    func execute() -> [Product] {
        return Product.latestProducts()
    }
    
}
