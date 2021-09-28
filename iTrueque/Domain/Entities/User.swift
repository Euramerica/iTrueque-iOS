//
//  UserEntity.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation



/// Entity for User itself
struct User: Identifiable, Codable {

    
    enum CodingKeys : String, CodingKey {
        case id = "id_user"
    }
    
    let id: Identifier
    
}
