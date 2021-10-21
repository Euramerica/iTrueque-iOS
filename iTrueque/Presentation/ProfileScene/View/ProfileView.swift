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
        HStack{
            if let avatar = URL(string: viewModel.state.user.avatar) {
                URLImage(
                    url: avatar,
                    placeholder: Rectangle().background(Color.light),
                    configuration: { $0.resizable() }
                )
                .scaledToFit()
                .padding(.all, 4)
                .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.state.user.name).font(.title)
                Text(viewModel.state.user.surname).font(.title2)
                Text(viewModel.state.user.email).font(.body)
                Button(action: {
                    viewModel.handle(.logout)
                }) {
                    Text("logout")
                }
            }
            
            
        }.onAppear() {
            viewModel.handle(.onAppear)
        }
        

    }
    
}

// MARK:- Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
