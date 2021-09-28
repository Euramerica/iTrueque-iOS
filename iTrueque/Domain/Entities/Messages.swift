//
//  Messages.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation


struct Messages: Identifiable, Codable {
    let id:         Identifier
    let ownerId:    Identifier
    let productId:  Identifier
    let userId:     Identifier
    let massage:    String
}

