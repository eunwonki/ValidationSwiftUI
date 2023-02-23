//
//  LoginFormError.swift
//  LoginValidation
//
//  Created by Liam Eun on 2023/02/23.
//

import Foundation

enum LoginFormError: LocalizedError, Identifiable {
    case eamilEmpty
    case invalidEmail
    case passwordEmpty
    
    var id: Int { hashValue }
    
    var errorDescription: String? {
        switch(self) {
        case .eamilEmpty:
            return "Email cannot be empty!"
        case .invalidEmail:
            return "Email is not correct format"
        case .passwordEmpty:
            return "Password cannot be empty!"
        }
    }
}
