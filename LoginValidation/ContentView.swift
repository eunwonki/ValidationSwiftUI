//
//  ContentView.swift
//  LoginValidation
//
//  Created by wonki on 2023/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && email.isValidEmail
    }
    
    var body: some View {
        Form {
            TextField("email", text: $email)
                .textInputAutocapitalization(.none)
            SecureField("password", text: $password)
            Button("Login") {
                
            }.disabled(!isFormValid)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
