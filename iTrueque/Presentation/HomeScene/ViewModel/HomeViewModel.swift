//
//  HomeViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 19/10/21.
//

import Combine
import SwiftUI

struct HomeState {
    var dataState: ModelDataState = .idle
    var genres: [Genre] = []
    var latestBooks: [Product] = []
    var popularBooks: [Product] = []
    
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}

enum HomeAction {
    case onAppear
    case getGenres
    case getLatestBooks
    case getPopularBooks
}

class HomeViewModel: ViewModel {
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let coordinatorActions: TabBarViewModelActions?
    private let getGenres = GetGenres()
    private let getLatestBooks = GetLatestBooks()
    private let getPopularBooks = GetMostPopular()
    
    @Published
    var state: HomeState
    
    init(state: HomeState,
         coordinatorActions: TabBarViewModelActions? = nil) {
        self.state = state
        self.coordinatorActions = coordinatorActions
        self.state.changeViewModelState(newViewModelState: .loading)
    }
    
    func handle(_ action: HomeAction) {
        switch action {
        case .onAppear:
            self.handle(.getGenres)
            self.handle(.getLatestBooks)
            self.handle(.getPopularBooks)
            
        case .getGenres:
            getGenres.execute()
                .sink{ completion in
                    switch completion {
                    case .finished:
                        print("get genres finished")
                    case .failure(_):
                        print("get genres failures")
                    }
                } receiveValue: { [weak self] genres in
                    print("get genres receive")
                    self?.state.genres = genres
                }
                .store(in: &cancellableSet)
            
        case .getLatestBooks:
            getLatestBooks.execute()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("get latest books finished")
                    case .failure(_):
                        print("get latest books failures")
                    }
                } receiveValue: { [weak self] books in
                    print("get latest books receive")
                    self?.state.latestBooks = books
                }
                .store(in: &cancellableSet)

        case .getPopularBooks:
            getPopularBooks.execute()
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(_):
                        break
                    }
                } receiveValue: { [weak self] books in
                    self?.state.popularBooks = books
                }
                .store(in: &cancellableSet)
        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}
