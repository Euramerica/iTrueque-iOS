//
//  IntroView.swift
//  iTrueque
//
//  Created by Osvaldo Chaparro Bolaños on 27/9/21.
//

import SwiftUI

struct IntroView: View {
    
    
    
    @State private var showLogin: Bool   = false
    @State private var showRegiter: Bool = false
    
    @EnvironmentObject
    var viewModel: AnyViewModel<SplashState, SplashAction>
    
    var body: some View {
        VStack{
            VStack{
                Image("itrueque-logo")
                    .resizable()
                    .scaledToFit()
                    .padding(35)
            }.padding(.top, 80)
            
            Spacer()
            
            Button(action: {
                
            }) {
                HStack(spacing: 70){
                    Image("apple-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Continue_with_apple".localized()).foregroundColor(.black)
                    Spacer()
                }
                .frame(height: 20, alignment: .center)
                .padding(10)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(14)
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.bottom, 5)
            
            Button(action: {
                
            }) {
                HStack(spacing: 70){
                    Image(systemName: "mail").foregroundColor(.white)
                    Text("Continue_with_email".localized()).foregroundColor(.white)
                    Spacer()
                }
                .frame(height: 20, alignment: .center)
                .padding(10)
            }
            .background(Color.mainColor)
            .cornerRadius(14)
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .padding(.bottom, 50)
            
            HStack{
                Text("Already_has_account".localized()).foregroundColor(.white).fontWeight(.light)
                Button(action: {
                    
                    showLogin.toggle()
                    
                }) {
                    Text("Login".localized()).foregroundColor(.mainColor).fontWeight(.semibold)
                }
                .sheet(isPresented: $showLogin, content: {
                    LoginView()
                })
            }
            .padding(.bottom, 50)
            
        }
        .frame(maxWidth: .infinity)
        .background(Image("background-intro")
            .resizable()
            .frame(width: .infinity, height: .infinity, alignment: .center))
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK:- Preview
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
