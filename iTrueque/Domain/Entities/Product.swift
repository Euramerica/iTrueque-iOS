//
//  Product.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation
import FirebaseFirestoreSwift

struct Product: Codable, Identifiable {
    @DocumentID public var id: String?
    let userId: String
    let title: String
    let author: String
    let photoURL: String
}
