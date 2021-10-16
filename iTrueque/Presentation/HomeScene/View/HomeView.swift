//
//  HomeView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 15/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    
    
    var body: some View {
        
        List{
            HStack(alignment: .center){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 21, height: 21, alignment: .center)
                    .padding(.leading, 32)
                    .foregroundColor(.bodyColor)
                TextField("Read_today".localized(), text: $searchText)
                    .multilineTextAlignment(.center)
                
            }
            .frame(height: 56)
            .background(Color.secondaryBackground)
            .cornerRadius(8)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            
            
            // Genre row
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach(0 ..< 5) { item in
                        Text("Aventura")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color.mainColor)
                            .cornerRadius(8)
                    }
                }
            }
            
            // Latest row
            VStack(alignment: .leading){
                HStack{
                    Text("+")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Recientes")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .foregroundColor(.textTitleColor)
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 16){
                        ForEach(0 ..< 5) { item in
                            LatestCell()
                                .frame(width: 200, height: 220)
                                .background(Color.white)
                                .padding()
                        }
                    }
                    
                }
                
            }
            .frame(height: 320)
            .padding(.top, 32)
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}


//ScrollView {
//    LazyHStack(spacing: 16){
//        ForEach(0 ..< 5) { item in
//            Text("Aventura")
//                .font(.title2)
//                .fontWeight(.bold)
//                .foregroundColor(.white)
//                .padding(.all, 8)
//                .background(Color.mainColor)
//                .cornerRadius(8)
//        }
//    }
//    .background(Color.secondaryBackground)
//    .padding(.top, 16)
//    .padding(.horizontal, 16)
//}
