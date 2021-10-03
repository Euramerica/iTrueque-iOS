//
//  FirebasePath.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation

///This enum registers all available end point paths for Firebase API to avoid typo mistakes
enum FirestorePath: String {
    
    case bookmarks = "favorites"
    case messages  = "messages"
    case reviews   = "opiniones"
    case products  = "products"
    case users     = "user"
    case genre     = "genre"
    
    var path: String {
        return self.rawValue
    }
}
