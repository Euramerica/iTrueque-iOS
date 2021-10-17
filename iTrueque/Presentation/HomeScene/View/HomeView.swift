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
        VStack{
            
            //SearchView
            SearchView(searchText: $searchText)
            
            //Main scroll view
            ScrollView(.vertical){
                
                
                //Genrer row
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(0 ..< 5) { _ in
                            TagedView()
                        }
                    }
                }
                .padding(.top, 32)
                
                
                
                //Main row
                VStack(alignment: .leading) {
                    SectionView(title: "Latest".localized())
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 32){
                            ForEach(0 ..< 5) { _ in
                                FeaturedView()
                            }
                        }
                    }
                }.padding(.top, 32)
                
                
                // Continues content
                VStack(alignment: .leading) {
                    SectionView(title: "Popular".localized())
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 32){
                            ForEach(0 ..< 5) { _ in
                                SecondaryView()
                            }
                        }
                    }
                }.padding(.top, 32)
            
            }
            .padding()
            
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




struct TagedView: View {
    var body: some View {
        Text("Aventura")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.all, 8)
            .background(Color.mainColor)
            .cornerRadius(8)
    }
}
