//
//  GetMostPopularUseCase.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation


public final class GetMostPopular{
    
    func execute() -> [Product]{
        Product.popularProducts()
    }
}