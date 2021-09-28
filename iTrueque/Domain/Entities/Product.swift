//
//  Products.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation


enum ProductState: Int, Codable {
    case isActive
    case isIdle
    case isGifted
    case isExchangeble
}

/// Entity for Product itself
struct Product: Identifiable, Codable {
    
    enum CodingKeys : String, CodingKey {
        case id         = "id_producto"
        case userId     = "id_user"
        case title
        case condition
        case state      = "product_state"
        case createdAt  = "fecha_alta"
        case modAt      = "fecha_mod"
        case coord      = "ubicacion"
        case isActive
    }
    
    //
    let id:         Identifier
    let userId:     Identifier
    let title:      String
    let condition:  Contidion
    let state:      ProductState
    let createdAt:  Date
    let modAt:      Date
    let coord:      Coordinate
    let isActive:   Bool
}
