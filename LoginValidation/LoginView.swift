//
//  ContentView.swift
//  LoginValidation
//
//  Created by wonki on 2023/02/22.
//

import SwiftUI

struct LoginView: View {
    static let EMAIL_TEXTFIELD = "CONTENTVIEW_EMAIL_TEXTFIELD"
    static let PASSWORD_TEXTFIELD = "CONTENTVIEW_PASSWORD_TEXTFIELD"
//    static let EMAILERROR_TEXT = "CONTENTVIEW_EMAILERROR_TEXT"
//    static let PASSWORDERROR_TEXT = "CONTENTVIEW_PASSWORDERROR_TEXT"
    static let LOGIN_BUTTON = "CONTENTVIEW_LOGIN_BUTTON"
    
    @State var email: String = ""
    @State var password: String = ""
    @State var loginFormErrors: [LoginFormError] = []
    
    var isFormValid: Bool {
        loginFormErrors.removeAll()
        
        if email.isEmpty {
            loginFormErrors.append(.eamilEmpty)
        } else if !email.isValidEmail {
            loginFormErrors.append(.invalidEmail)
        }
        
        if password.isEmpty {
            loginFormErrors.append(.passwordEmpty)
        }
        
        return loginFormErrors.isEmpty
    }
    
    var body: some View {
        Form {
            TextField("email", text: $email)
                .textInputAutocapitalization(.none)
                .accessibilityIdentifier(LoginView.EMAIL_TEXTFIELD)
            SecureField("password", text: $password)
                .accessibilityIdentifier(LoginView.PASSWORD_TEXTFIELD)
            
            Button("Login") {
                if self.isFormValid {
                    // submit the form
                }
            }
            .accessibilityIdentifier(LoginView.LOGIN_BUTTON)
            
            ValidationSummaryView(errors: loginFormErrors)
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
