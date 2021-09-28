//
//  Products.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation


enum ProductState: Int, Codable {
    case isActive      = 0
    case isIdle        = 1
    case isGifted      = 2
    case isExchangeble = 3
    
    var state: Int {
        return self.rawValue
    }
}

/// Entity for Product itself
struct Product: Identifiable, Codable {
    
    //
    let id:         Identifier
    let userId:     Identifier
    let exchangeId: Identifier
    let title:      String
    let condition:  Condition
    let state:      ProductState
    let createdAt:  Date
    let modAt:      Date
    let coord:      Coordinate
    let isActive:   Bool
}
