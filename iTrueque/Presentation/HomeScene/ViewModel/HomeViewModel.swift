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
    
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}

enum HomeAction {
    case onAppear
    case getGenres
}

class HomeViewModel: ViewModel {
    
    private var cancellableSet: Set<AnyCancellable> = []
    private let coordinatorActions: TabBarViewModelActions?
    private let getGenres = GetGenresUseCase()
    
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
        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}
