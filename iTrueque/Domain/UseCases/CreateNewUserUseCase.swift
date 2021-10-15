//
//  CreateNewUserUseCase.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 12/10/21.
//

import Foundation
import Combine

public final class CreateNewUser{
    
    private let repository = UserAuthenticationRepository()
    
    func execute(userName: String, email: String, password: String) -> AnyPublisher<UserApp, Error>{
        repository.createUser(userName: userName, email: email, password: password)
            .eraseToAnyPublisher()
    }
    
    
}
