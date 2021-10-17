//
//  Toast.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 17/10/21.
//

import SwiftUI

public enum ToastState: Equatable {
    case none
    case success(_ title: String, _ message: String)
    case failure(_ title: String, _ message: String)
}

public struct Toast: View {
    public init(title: String, subtitle: String, accentColor: Color) {
        self.title = title
        self.subtitle = subtitle
        self.accentColor = accentColor
    }

    let title: String
    let subtitle: String
    let accentColor: Color

    public var body: some View {
        VStack(alignment: .center) {
            card
            Spacer()
        }
    }

    private var card: some View {
        Card {
            HStack(alignment: .top, spacing: 16.0) {
                VStack(spacing: 4.0) {
                    Text(title)
                    Text(subtitle)
                }
                Spacer()
            }
        }.foregroundColor(.bodyColorDark)
            .overlay(
                RoundedRectangle(cornerRadius: 16.0)
                    .stroke(accentColor, lineWidth: 1)
            )
            .padding(20.0)
    }
}

struct ToastPreview: PreviewProvider {
    static var previews: some View {
        Toast(title: "", subtitle: "", accentColor: Color.mainColor)
    }
}
