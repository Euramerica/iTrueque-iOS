//
//  GenreButton.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 17/10/21.
//

import SwiftUI

public typealias VoidCompletion = () -> Void

struct GenreButton: View {
    
    let image: String
    let title: String
    let action: VoidCompletion
    
    public init(image: String, title: String, action: @escaping VoidCompletion) {
        self.image = image
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            VStack{
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(Color.mainColor)
                    .frame(width: 32, height: 32, alignment: .center)
                    .background(Color.white)
                Text(title)
                    .font(.system(size: 16.0, weight: .light))
                    .foregroundColor(Color.textTitleColor)
            }
            .padding(.trailing)
            
        }
    }
}

struct GenreButton_Previews: PreviewProvider {
    static var previews: some View {
        GenreButton(image: "globe.europe.africa", title: "Viajes", action: {})
            .previewLayout(.sizeThatFits)
    }
}

