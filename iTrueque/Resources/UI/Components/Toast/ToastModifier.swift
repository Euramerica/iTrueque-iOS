//
//  ToastModifier.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 17/10/21.
//

import SwiftUI

public extension View {
    func toast(_ state: Binding<ToastState>) -> some View {
        modifier(ToastModifier(viewModel: ToastViewModel(state)))
    }
}

public final class ToastPresentationObject: ObservableObject {
    @Published public var state: ToastState = .none

    public init() {}
}

struct ToastModifier<ViewModel: ToastViewViewModel>: ViewModifier {
    @ObservedObject var viewModel: ViewModel

    @ViewBuilder
    func body(content: Content) -> some View {
        content
            .overlay(overlay())
    }

    @ViewBuilder private func overlay() -> some View {
        GeometryReader { geometry in
            content()
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .transition(.offset(x: 0, y: -geometry.frame(in: .global).maxY))
                .animation(.easeInOut(duration: 0.8))
                .onAppear(perform: viewModel.onAppear)
                .onTapGesture(perform: viewModel.dismiss)
        }
    }

    @ViewBuilder private func content() -> some View {
        if case .success(let title, let messasge) = viewModel.state {
            Toast(title: title, subtitle: messasge, accentColor: Color.mainColor)
        }

        if case .failure(let title, let messasge) = viewModel.state {
            Toast(title: title, subtitle: messasge, accentColor: Color.errorColor)
        }
    }
}
