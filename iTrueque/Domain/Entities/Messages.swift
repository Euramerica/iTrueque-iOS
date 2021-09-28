//
//  Messages.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation

enum MessageStatus: Int, Codable {
    case received  = 0 //Sent and read
    case delivered = 1 //Sent and not read
    case pedding   = 2 //Nor sent or read
}

struct Messages: Identifiable, Codable {
    let id:         Identifier
    let ownerId:    Identifier
    let productId:  Identifier
    let massage:    String
    let createdAt:  Date
    let status:     MessageStatus
}

