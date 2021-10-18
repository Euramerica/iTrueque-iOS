//
//  GetGenreUseCase.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 18/10/21.
//

import Foundation


public final class GetGenresUseCase{
    
    func execute() ->  [Genre]{
        return Genre.genres()
    }
    
}
