//
//  Messages.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation


/// Current status of a message
enum MessageStatus: Int, Codable {
    case received  = 0 //Sent and read
    case delivered = 1 //Sent and not read
    case pedding   = 2 //Nor sent or read
}


/// Entity for Message itself
struct Message: Remotable {
    let id:         Identifier
    let ownerId:    Identifier
    let productId:  Identifier
    let massage:    String
    let createdAt:  Date
    let status:     MessageStatus
}
