//
//  TabBarView.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            NavigationView{
                Text("Home")
            }
            .tabItem {
                VStack{
                    Text("Home")
                }
            }
            NavigationView{
                Text("Config")
            }
            .tabItem {
                VStack{
                    Text("Config")
                }
            }
        }
    }
    
}

// MARK:- Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
