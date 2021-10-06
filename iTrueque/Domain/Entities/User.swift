//
//  User.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import Foundation

/// Entity for User itself
struct User: Remotable {
    let id: Identifier
    let userName: Name
    let email:    Email
    let password: Password
    let coord:    Coordinate
    let avatar:   Avatar
    let isActive: Bool
}
