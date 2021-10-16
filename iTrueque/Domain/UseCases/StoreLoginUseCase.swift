//
//  StoreLoginUseCase.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 15/10/21.
//

import Combine
import Foundation

public final class StoreLogin {
    private let repository = UserAuthenticationRepository()
    
    func execute(_ user: UserApp) -> AnyPublisher<Void, Error> {
        repository.storeLogin(user)
            .eraseToAnyPublisher()
    }
}
