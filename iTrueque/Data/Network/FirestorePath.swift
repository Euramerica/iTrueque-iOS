//
//  Path.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation


///This enum keeps register a copy of all available paths on the app
enum FirestorePath: String {
    
    case bookmarks = "favoritos"
    case messages  = "mensajes"
    case reviews   = "opiniones"
    case products  = "productos"
    case users     = "usuarios"
    
    var path: String {
        return self.rawValue
    }
}
