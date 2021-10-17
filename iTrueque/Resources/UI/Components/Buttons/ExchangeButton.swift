//
//  ExchangeButton.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 17/10/21.
//

import SwiftUI

struct ExchangeButton: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "arrow.left.arrow.right")
                .foregroundColor(.white)
                .padding()
                .frame(width: 32, height: 32, alignment: .center)
                .background(Color.mainColor)
                .clipShape(Circle())
        })
    }
}

struct ExchangeButton_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeButton()
            .previewLayout(.sizeThatFits)
    }
}
