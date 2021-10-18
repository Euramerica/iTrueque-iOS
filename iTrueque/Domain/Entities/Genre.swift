//
//  Genre.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation

enum GenreType: String, Codable{
    case adventure = "Aventura"
    case scifi     = "C. Ficcion"
    case romance   = "Romance"
    case technical = "Tecnico"
    case thriller  = "Triller"
    case fantasy   = "Fantasia"
    
    var description: String {
        return self.rawValue
    }
}

struct Genre: Requestable {
    let id: String
    let generType: GenreType
    
    static func genres() -> [Genre]{
        return [
            Genre(id: "1", generType: .adventure),
            Genre(id: "2", generType: .scifi),
            Genre(id: "3", generType: .romance),
            Genre(id: "4", generType: .technical),
            Genre(id: "5", generType: .thriller),
            Genre(id: "6", generType: .fantasy)
        ]
    }
}
