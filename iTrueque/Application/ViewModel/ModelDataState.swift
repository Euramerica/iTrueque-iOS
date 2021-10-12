//
//  DataModelState.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 12/10/21.
//

import Foundation

enum ModelDataState: Equatable {
    static func == (lhs: ModelDataState, rhs: ModelDataState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        default:
            return false
        }
    }
    case idle
    case loading
    case loaded
    case error(Error)
}
