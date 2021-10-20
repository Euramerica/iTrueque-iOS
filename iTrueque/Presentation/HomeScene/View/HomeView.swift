//
//  HomeView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 15/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
        
    @EnvironmentObject
    var viewModel: AnyViewModel<HomeState, HomeAction>
    
    var body: some View {
        VStack{
            
            //SearchView
            SearchView(searchText: $searchText)
            
            //Main scroll view
            ScrollView(.vertical){
                //Genrer row
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(viewModel.state.genres) { genre in
                            //TagView(tagTitle: genre.generType.description)
                            GenreButton(image: genre.image, title: genre.title , action: {})
                        }
                    }
                }
                .padding(.top, 8)
                
                //Main row
                VStack(alignment: .leading) {
                    SectionView(title: "Latest".localized())
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 32){
                            ForEach(viewModel.state.latestBooks) { book in
                                FeaturedView(product: book)
                            }
                        }
                    }
                }.padding(.top, 16)
                
                // Continues content
                VStack(alignment: .leading) {
                    SectionView(title: "Populars".localized())
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 32){
                            ForEach(viewModel.state.popularBooks) { book in
                                SecondaryView(product: book)
                            }
                        }
                    }
                }.padding(.top, 32)
            
            }
            .padding(.top, 0)
            .padding(.leading)
        }
        .onAppear() {
            viewModel.handle(.onAppear)
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


