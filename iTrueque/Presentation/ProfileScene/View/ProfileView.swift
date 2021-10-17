//
//  ProfileView.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 15/10/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject
    var viewModel: AnyViewModel<ProfileState, ProfileAction>
    
    var body: some View {
        Button(action: {
            viewModel.handle(.logout)
        }) {
            Text("logout")
        }

    }
    
}

// MARK:- Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
