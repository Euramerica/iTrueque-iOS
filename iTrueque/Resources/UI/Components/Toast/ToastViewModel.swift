//
//  ToastViewModel.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 17/10/21.
//

import SwiftUI

protocol ToastViewViewModel: ObservableObject {
    func onAppear()
    func dismiss()
    var state: ToastState { get set }
}

class ToastViewModel: ToastViewViewModel {
    @Binding var state: ToastState

    private var timer: Timer?
    private let presentationDuration: TimeInterval

    init(_ state: Binding<ToastState>, presentationDuration: TimeInterval = 4.0) {
        _state = state
        self.presentationDuration = presentationDuration
    }

    func onAppear() {
        invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: presentationDuration, repeats: false) { [weak self] _ in
            self?.dismiss()
        }
    }

    func dismiss() {
        state = .none
        invalidate()
    }

    private func invalidate() {
        timer = nil
    }
}
