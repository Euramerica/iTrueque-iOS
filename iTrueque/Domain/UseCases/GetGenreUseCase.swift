//
//  GetGenreUseCase.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Combine
import Foundation

public final class GetGenresUseCase{
    private let repository = GenreCollectionRepository()
    
    func execute() -> AnyPublisher<[Genre], Error> {
        repository.getAllGenres()
            .eraseToAnyPublisher()
    }
    
}
