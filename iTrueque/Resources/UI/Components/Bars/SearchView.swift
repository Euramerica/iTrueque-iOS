//
//  SearchView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 17/10/21.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 21, height: 21, alignment: .center)
                .padding(.leading, 12)
                .foregroundColor(.bodyColor)
            TextField("Read_today".localized(), text: $searchText)
                .multilineTextAlignment(.leading)
            
        }
        .frame(height: 46)
        .background(Color.secondaryBackground)
        .cornerRadius(8)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant("The hobbit"))
            .previewLayout(.sizeThatFits)
    }
}
