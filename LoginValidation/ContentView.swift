//
//  ContentView.swift
//  LoginValidation
//
//  Created by wonki on 2023/02/22.
//

import SwiftUI

struct LoginState {
    var email: String = ""
    var password: String = ""
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func clearErrors() {
        emailError = nil
        passwordError = nil
    }
    
    mutating func isValid() -> Bool {
        clearErrors()
        
        if email.isEmpty {
            emailError = LoginError.emailEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }
        
        if password.isEmpty {
            passwordError  = LoginError.passwordEmpty
        }
        
        return emailError == nil && passwordError == nil
    }
}

struct ContentView: View {
    
    @State private var loginState = LoginState()
    
    var body: some View {
        Form {
            TextField("email", text: $loginState.email)
                .textInputAutocapitalization(.none)
            if let emailError = loginState.emailError {
                Text(emailError.localizedDescription)
                    .font(.captain)
            }
            
            SecureField("password", text: $loginState.password)
            if let passwrdError = loginState.passwordError {
                Text(passwrdError.localizedDescription)
                    .font(.captain)
            }
            
            Button("Login") {
                if loginState.isValid() {
                    // perform login
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
