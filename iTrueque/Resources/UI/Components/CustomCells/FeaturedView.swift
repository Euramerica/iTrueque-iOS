//
//  LatestCell.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 15/10/21.
//

import SwiftUI

struct FeaturedView: View {
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
                        Text("The Hobbit")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Tolkien")
                            .font(.body)
                    }
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
        FeaturedView()
            .previewLayout(.sizeThatFits)
    }
}


