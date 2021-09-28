//
//  Condition.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation



///Represents the actual condition of a Product
struct Contidion: Identifiable, Codable {
    
    //
    let id:        Identifier
    let productId: Identifier
    let condition: String
}
