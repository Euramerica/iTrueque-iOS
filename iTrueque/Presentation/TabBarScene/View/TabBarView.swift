//
//  TabBarView.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 26/9/21.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var viewModel: AnyViewModel<TabBarState, TabBarAction>
    
    var body: some View {
        TabView {
            ForEach(viewModel.tabItemViewModels, id: \.self) { viewModel in
                tabView(for: viewModel.type)
                    .tabItem {
                        Image(systemName: viewModel.imageName)
                        Text(viewModel.title)
                    }
            }
        }
        
    }
    
    @ViewBuilder
    func tabView(for tabItemType: TabItemViewModel.TabItemType) -> some View {
        switch tabItemType {
        case .home:
           HomeView()
            
        case .addProduct:
            Text("Add product")
            
        case .profile:
            if let profileScreenViewModel = viewModel.state.profileScreenViewModel {
                ProfileView().environmentObject(
                    AnyViewModel(profileScreenViewModel)
                )
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
