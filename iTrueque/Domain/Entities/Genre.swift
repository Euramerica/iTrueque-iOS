//
//  Genre.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation
import FirebaseFirestoreSwift

enum GenreType: String, Codable{
    case adventure = "Aventura"
    case scifi     = "C. Ficcion"
    case romance   = "Romance"
    case technical = "Tecnico"
    case thriller  = "Triller"
    case fantasy   = "Fantasia"
    case travel   = "Viajes"
    
    var description: String {
        return self.rawValue
    }
}

struct Genre: Codable, Identifiable {
    @DocumentID public var id: String?
    let image: String
    let title: String
}
