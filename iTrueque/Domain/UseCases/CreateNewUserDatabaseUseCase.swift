//
//  CreateNewUserDatabaseUseCase.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 17/10/21.
//

import Foundation
import Combine

public final class CreateNewUserDatabase{
    
    private let repository = UserAuthenticationRepository()
    
    func execute(user: UserApp) -> AnyPublisher<UserApp, Error>{
        repository.createUserDatabase(user: user)
            .eraseToAnyPublisher()
    }
    
}
