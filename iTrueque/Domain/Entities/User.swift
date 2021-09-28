//
//  UserEntity.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 28/9/21.
//

import Foundation


/// Entity for User itself
struct User: Identifiable, Codable {
    let id: Identifier
    let userName: Name
    let email:    Email
    let password: Password
    let coord:    Coordinate
    let avatar:   Avatar
    let isActive: Bool
}
