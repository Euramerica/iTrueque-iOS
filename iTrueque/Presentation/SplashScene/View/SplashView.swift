//
//  SplashView.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 3/10/21.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject
    var viewModel: AnyViewModel<SplashState, SplashAction>
    
    @State var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            Image("itrueque-logo")
                .resizable()
                .scaleEffect(scale)
                .scaledToFit()
                .padding(50)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)

                    withAnimation(repeated) {
                        scale = 0.9
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundColor)
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            self.viewModel.handle(.checkStoredLogin)
        }
        
        
    }
}

// MARK:- Preview
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
