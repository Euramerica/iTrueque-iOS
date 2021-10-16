//
//  TabBarViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import Combine
import SwiftUI

struct TabBarViewModelActions {
    let showIntro: () -> Void
}

struct TabBarState {
    var dataState: ModelDataState = .idle
    var tabItemViewModels: [TabItemViewModel] = []
    var profileScreenViewModel: ProfileViewModel? = nil
    
    mutating func changeViewModelState(newViewModelState: ModelDataState) {
        dataState = newViewModelState
    }
}

enum TabBarAction {
    case onAppear
}

struct TabItemViewModel: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case home
        case addProduct
        case profile
    }
}

final class TabBarViewModel: ViewModel {
    
    private let coordinatorActions: TabBarViewModelActions?
    private var cancellableSet: Set<AnyCancellable> = []
    //let profileScreenViewModel: ProfileViewModel
    
    let tabItemViewModels = [
        TabItemViewModel(imageName: "house.fill", title: "Home", type: .home),
        TabItemViewModel(imageName: "plus.square.fill", title: "Add Book", type: .addProduct),
        TabItemViewModel(imageName: "person.fill", title: "Profile", type: .profile)
    ]
    
    
    @Published
    var state: TabBarState
    
    init(state: TabBarState, coordinatorActions: TabBarViewModelActions? = nil, profileScreenViewModel: ProfileViewModel) {
        self.state = state
        self.coordinatorActions = coordinatorActions
        //self.profileScreenViewModel = profileScreenViewModel
        self.state.profileScreenViewModel = profileScreenViewModel
        self.state.changeViewModelState(newViewModelState: .loading)
        self.state.tabItemViewModels = tabItemViewModels
    }
    
    func handle(_ action: TabBarAction) {
        switch action {
        case .onAppear:
            print("onAppear tabBar viewModel")
        }
    }
    
    deinit {
        cancellableSet.removeAll()
    }
    
}
