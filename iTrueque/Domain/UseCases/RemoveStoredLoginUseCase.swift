//
//  RemoveStoreLoginUseCase.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 15/10/21.
//

import Combine
import Foundation

public final class RemoveStoredLogin {
    private let repository = UserAuthenticationRepository()
    
    func execute() -> AnyPublisher<Void, Error> {
        repository.removeStoredLogin()
            .eraseToAnyPublisher()
    }
}
