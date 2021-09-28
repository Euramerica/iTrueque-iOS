//
//  Reviews.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation


struct Reviews: Identifiable, Codable {
    
    let id:          Identifier
    let productId:   Identifier
    let userId:      Identifier
    let description: String
    let rate:        Int8
}
