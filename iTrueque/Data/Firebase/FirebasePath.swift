//
//  FirebasePath.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation

///This enum registers a copy of all available paths for Firebase API to avoid typo mistakes
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
