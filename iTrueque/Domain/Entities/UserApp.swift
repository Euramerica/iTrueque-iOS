//
//  UserApp.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 5/10/21.
//

import Foundation
import FirebaseFirestoreSwift

struct UserApp: Codable, Identifiable {
    @DocumentID public var id: String?
    let uid: String
    let name: String
    let surname: String
    let email: String
    let password: String
    let avatar: String
}
