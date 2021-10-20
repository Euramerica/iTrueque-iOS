//
//  SecondatyCellType.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 17/10/21.
//

import SwiftUI

struct SecondaryView: View {
    
    let product: Product
    
    var body: some View {
        HStack{
            URLImage(
                url: URL(string: product.photoURL)!,
                placeholder: Rectangle().background(Color.light),
                configuration: { $0.resizable() }
            )
            .scaledToFit()
            .padding(.all, 4)
            VStack(alignment: .leading){
                Text(product.title)
                    .font(.title2)
                    .foregroundColor(.textTitleColor)
                Text(product.author)
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

//struct SecondatyCellType_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondaryView(product: Product(id: "1", userId: "1", exchangeId: "1", title: "The hobbit", author: "Tolkien", condition: "nuebo", createdAt: Date(), modAt: Date(), img: "www.google.com"))
//            .previewLayout(.sizeThatFits)
//    }
//}
