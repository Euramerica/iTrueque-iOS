//
//  Alias.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 2/10/21.
//

import UIKit

/// Alias for Codable & Identifiable. Use for entity to conform both for RESTApi and SwiftUI purposes
typealias Remotable = Codable & Identifiable

/// Unique identifier for ID properties
typealias Identifier = String

/// For lat and long. It expect a CGFloat or Double
typealias Coordinate = CGPoint

/// Descrive itself for some kind of product condition
typealias Condition = String

/// Descrive itself for some kind of user name
typealias Name = String

/// Descrive itself for some kind of user email
typealias Email = String

/// Descrive itself for some kind of user password
typealias Password = String

/// Descrive itself for some kind of user string url that leads to avatar
typealias Avatar = String
