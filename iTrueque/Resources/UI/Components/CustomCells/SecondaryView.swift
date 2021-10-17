//
//  SecondatyCellType.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 17/10/21.
//

import SwiftUI

struct SecondaryView: View {
    var body: some View {
        HStack{
            Image("book")
                .resizable()
                .scaledToFit()
                .padding(.all, 4)
            VStack(alignment: .leading){
                Text("Title")
                    .font(.title2)
                    .foregroundColor(.textTitleColor)
                Text("Author")
                    .font(.body)
                    .foregroundColor(.bodyColor)
            }
            
            Spacer()
            ExchangeButton()
                .padding(.trailing, 4)
            
        }
        .frame(width: 256, height: 64)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.mainColor, lineWidth: 3)
        )
    }
}

struct SecondatyCellType_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryView()
            .previewLayout(.sizeThatFits)
    }
}
