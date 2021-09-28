//
//  Genre.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation

enum GenreType: Int, Codable {
    case adventure = 0
    case classic   = 1
    case thriller  = 2
    case thecnical = 3
    case scifi     = 4
}


struct Genre: Identifiable, Codable {
    let id:    Identifier
    let genre: GenreType
}
