//
//  Card.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 17/10/21.
//

import SwiftUI

public struct Card<Content: View>: View {
    let content: () -> Content
    let padding: CGFloat
    let cornerRadius: CGFloat

    public init(_ padding: CGFloat = 16.0, _ cornerRadius: CGFloat = 8.0, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.padding = padding
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        content()
            .padding(padding)
            .background(Color.light)
            .cornerRadius(cornerRadius)
    }
}
