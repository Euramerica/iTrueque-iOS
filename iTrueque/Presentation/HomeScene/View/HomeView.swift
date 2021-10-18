//
//  HomeView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 15/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    
    let getGenresUseCase = GetGenresUseCase()
    let getLatestUseCase = GetLatestBooks()
    let getPopularUseCase = GetMostPopular()
    
    var body: some View {
        VStack{
            
            //SearchView
            SearchView(searchText: $searchText)
            
            //Main scroll view
            ScrollView(.vertical){
                //Genrer row
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(getGenresUseCase.execute()) { genre in
                            TagView(tagTitle: genre.generType.description)
                        }
                    }
                }
                .padding(.top, 32)
                
                //Main row
                VStack(alignment: .leading) {
                    SectionView(title: "Latest".localized())
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 32){
                            ForEach(getLatestUseCase.execute()) { product in
                                FeaturedView(product: product)
                            }
                        }
                    }
                }.padding(.top, 32)
                
                
                // Continues content
                VStack(alignment: .leading) {
                    SectionView(title: "Popular".localized())
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 32){
                            ForEach(getPopularUseCase.execute()) { product in
                                SecondaryView(product: product)
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


