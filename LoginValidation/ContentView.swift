//
//  ContentView.swift
//  LoginValidation
//
//  Created by wonki on 2023/02/22.
//

import SwiftUI

struct ContentView: View {
    static let EMAIL_TEXTFIELD = "CONTENTVIEW_EMAIL_TEXTFIELD"
    static let PASSWORD_TEXTFIELD = "CONTENTVIEW_PASSWORD_TEXTFIELD"
    static let EMAILERROR_TEXT = "CONTENTVIEW_EMAILERROR_TEXT"
    static let PASSWORDERROR_TEXT = "CONTENTVIEW_PASSWORDERROR_TEXT"
    static let LOGIN_BUTTON = "CONTENTVIEW_LOGIN_BUTTON"
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var loginFormError = LoginFormError()
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
    
    var isFormValid: Bool {
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required!"
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not correct format!"
        }
        
        if password.isEmpty {
            loginFormError.password = "password is  required!"
        }
        
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("email", text: $email)
                .textInputAutocapitalization(.none)
                .accessibilityIdentifier(ContentView.EMAIL_TEXTFIELD)
            if !loginFormError.email.isEmpty {
                Text(loginFormError.email)
                    .font(.caption)
                    .accessibilityIdentifier(ContentView.EMAILERROR_TEXT)
            }
            
            SecureField("password", text: $password)
                .accessibilityIdentifier(ContentView.PASSWORD_TEXTFIELD)
            if !loginFormError.password.isEmpty {
                Text(loginFormError.password)
                    .font(.caption)
                    .accessibilityIdentifier(ContentView.PASSWORDERROR_TEXT)
            }
            Button("Login") {
                if isFormValid {
                    // submit the form
                }
            }.accessibilityIdentifier(ContentView.LOGIN_BUTTON)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
