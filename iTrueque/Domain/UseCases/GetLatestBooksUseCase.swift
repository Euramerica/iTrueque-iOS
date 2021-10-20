//
//  GetLatestBooksUseCase.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Combine
import Foundation

public final class GetLatestBooks{
    private let repository = ProductCollectionRepository()
    
    func execute() -> AnyPublisher<[Product], Error> {
        repository.getLatestBooks()
            .eraseToAnyPublisher()
    }
    
}
