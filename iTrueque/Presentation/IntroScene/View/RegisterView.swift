//
//  RegisterView.swift
//  iTrueque
//
//  Created by Rodrigo Candido on 12/10/21.
//

import SwiftUI

struct RegisterView: View {
    
    //
    @State private var userName:    String = ""
    @State private var email:       String = ""
    @State private var password:    String = ""
    @State private var isEditing:   Bool = false
    
    
    //ViewModel
    @EnvironmentObject var viewModel: AnyViewModel<IntroState, IntroAction>
    
    var body: some View {
        VStack{
            HStack(alignment: .firstTextBaseline){
                Text("New_account".localized())
                    .padding(.top, 16)
                Spacer()
                Button {
                    viewModel.handle(.hideRegister)
                } label: {
                    Image(systemName: "xmark.square.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.mainColor)
                }
            }
            .padding(.horizontal, 16)
        
            VStack {
                TextField("Your_name".localized(), text: $userName) { currentEditState in
                    self.isEditing = currentEditState
                }
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(isEditing ?Color.mainColor :Color.bodyColor, lineWidth: 3)
                )
                
                TextField("Email".localized(), text: $email) { currentEditState in
                    self.isEditing = currentEditState
                }
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(isEditing ?Color.mainColor :Color.bodyColor, lineWidth: 3)
                )
                
                TextField("Password".localized(), text: $password) { currentEditState in
                    self.isEditing = currentEditState
                }
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding(.horizontal)
                .frame(height: 56)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(isEditing ?Color.mainColor :Color.bodyColor, lineWidth: 3)
                )
            
                Divider()
                    .padding(.top, 16)
                                
            }
            .padding(.top, 128)
            .padding(.horizontal, 16)
            Spacer()
        
            
            Button(action: {
                
                guard !email.isEmpty, !password.isEmpty, !userName.isEmpty else { return }
                viewModel.handle(.createNewUser(userName: userName, email: email, password: password))
                
            }, label: {
                Text("Register_user".localized())
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
            })
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.mainColor)
                    
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
