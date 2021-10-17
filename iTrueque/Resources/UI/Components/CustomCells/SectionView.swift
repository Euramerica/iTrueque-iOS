//
//  SectionView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 17/10/21.
//

import SwiftUI

struct SectionView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            Text("+")
                .font(.title)
                .fontWeight(.bold)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
        .foregroundColor(.textTitleColor)
    }
}


struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(title: "Preview")
            .previewLayout(.sizeThatFits)
    }
}
