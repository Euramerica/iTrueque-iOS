//
//  LatestCell.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 15/10/21.
//

import SwiftUI

struct FeaturedView: View {
    
    let product: Product
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: .infinity, height: .infinity)
            
            VStack{
                Image("book")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 4)
                Spacer()
                HStack {
                    //Book and Author
                    VStack(alignment: .leading){
                        Text(product.title)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text(product.author)
                            .font(.body)
                    }
                    .padding(.leading, 4)
                    .foregroundColor(.textTitleColor)
                    Spacer()
                    //Exchange Button
                    ExchangeButton()
                }
            }
            .frame(width: .infinity)
            .padding(.all, 4)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.mainColor, lineWidth: 3)
            )
        }
    }
}

struct LatestCell_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(product:    Product(id: "1", userId: "1", exchangeId: "1", title: "The hobbit", author: "Tolkien", condition: "nuebo", createdAt: Date(), modAt: Date(), img: "www.google.com"))
            .previewLayout(.sizeThatFits)
    }
}


