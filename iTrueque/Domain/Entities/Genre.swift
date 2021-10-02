//
//  Genre.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation


/// Accepted Genres on data base
enum GenreType: Int, Codable {
    case adventure = 0
    case classic   = 1
    case thriller  = 2
    case thecnical = 3
    case scifi     = 4
}


/// Entity for gener itself
struct Genre: Identifiable, Codable {
    let id:    Identifier
    let genre: GenreType
}
