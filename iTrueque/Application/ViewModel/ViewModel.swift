//
//  ViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 3/10/21.
//

import Combine
import SwiftUI

public protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Action

    var state: State { get }
    func handle(_ action: Action)
}

@dynamicMemberLookup
public final class AnyViewModel<State, Action>: ObservableObject {

    // MARK: Stored properties

    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedAction: (Action) -> Void

    // MARK: Computed properties

    public var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }

    var state: State {
        wrappedState()
    }

    // MARK: Methods

    func handle(_ action: Action) {
        wrappedAction(action)
    }

    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }

    // MARK: Initialization

    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Action == Action {
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { viewModel.state }
        self.wrappedAction = viewModel.handle
    }

}

public extension ViewModel {
    var any: AnyViewModel<State, Action> { AnyViewModel(self) }
}

extension AnyViewModel: Identifiable where State: Identifiable {
    public var id: State.ID {
        state.id
    }
}
