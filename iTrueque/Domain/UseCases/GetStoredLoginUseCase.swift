//
//  GetStoredLoginUseCase.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 4/10/21.
//

import Combine
import Foundation

public final class GetStoredLogin {
    private let repository = UserAuthenticationRepository()
    
    func execute() -> AnyPublisher<StoredLogin, Error> {
        repository.getStoredLogin()
            .eraseToAnyPublisher()
    }
}
