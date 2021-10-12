//
//  LoginView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 12/10/21.
//

import SwiftUI

struct LoginView: View {
    
    //
    @State private var email:       String = ""
    @State private var password:    String = ""
    @State private var isEditing:   Bool = false
    @Binding var dissmiss: Bool
    
    
    //ViewModel
    @EnvironmentObject var viewModel: AnyViewModel<IntroState, IntroAction>
    
    var body: some View {
        VStack{
            
            HStack(alignment: .firstTextBaseline){
                
                Text("Login".localized())
                    .padding(.top, 16)
                Spacer()
                Button {
                    dissmiss.toggle()
                } label: {
                    Image(systemName: "xmark.square.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.mainColor)
                }
            }
            .padding(.horizontal, 16)

        
            
            VStack {
                TextField("Email".localized(), text: $email) { currentEditState in
                    self.isEditing = currentEditState
                }
                .padding(.horizontal)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(isEditing ?Color.mainColor :Color.bodyColor, lineWidth: 3)
                )
                
                TextField("Password".localized(), text: $password) { currentEditState in
                    self.isEditing = currentEditState
                }
                .padding(.horizontal)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(isEditing ?Color.mainColor :Color.bodyColor, lineWidth: 3)
                )
            
                Divider()
                    .padding(.top, 16)
                
                Button("Forgot_password".localized()){}
                    .foregroundColor(.black)
                
            }
            .padding(.top, 128)
            .padding(.horizontal, 16)
            Spacer()
        
            
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty else { return }
                viewModel.handle(.doLogin(email: email, password: password))
                
            }, label: {
                Text("Login".localized())
                    .foregroundColor(.mainColor)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18))
                    .padding()
            })
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.mainColor, lineWidth: 1)
            )
            .padding(.horizontal, 16)
            
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(dissmiss: .constant(false))
    }
}
