//
//  GetProfileDataUseCase.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 21/10/21.
//

import Combine
import Foundation

public final class GetProfileData {
    private let repository = UserCollectionRepository()
    
    func execute() -> AnyPublisher<UserApp, Error> {
        repository.getProfileData()
            .eraseToAnyPublisher()
    }
    
}
