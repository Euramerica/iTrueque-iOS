//
//  Revies.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation


/// Entity for Reviews itself
struct Reviews: Remotable {
    
    let id:          Identifier
    let productId:   Identifier
    let userId:      Identifier
    let description: String
    let rate:        Int8
    let createdAt:   Date
}
