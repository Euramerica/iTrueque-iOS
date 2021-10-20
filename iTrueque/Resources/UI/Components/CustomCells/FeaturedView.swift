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
                URLImage(
                    url: URL(string: product.photoURL)!,
                    placeholder: Rectangle().background(Color.light),
                    configuration: { $0.resizable() }
                )
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
        }.frame(width: 280, height: 240)
    }
}


struct LatestCell_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(product:
                        Product(userId: "1", title: "The hobbit", author: "Tolkien", photoURL: "https://firebasestorage.googleapis.com/v0/b/itrueque-7eb1e.appspot.com/o/m4Bor02XgttVGNXlbAjo%2F80431278-674D-4D95-BB7D-37D537178CF1.jpeg?alt=media&token=7e731def-aaa9-4081-b8f3-8af3c37a6ded"))
            .previewLayout(.sizeThatFits)
    }
}


