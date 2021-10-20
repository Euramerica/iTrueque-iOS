//
//  Genre.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Genre: Codable, Identifiable {
    @DocumentID public var id: String?
    let image: String
    let title: String
}
