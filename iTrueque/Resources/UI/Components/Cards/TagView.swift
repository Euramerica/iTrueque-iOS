//
//  TagView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 17/10/21.
//

import SwiftUI

struct TagView: View {
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

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
            .previewLayout(.sizeThatFits)
    }
}
