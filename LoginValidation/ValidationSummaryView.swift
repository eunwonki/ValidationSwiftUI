//
//  ValidationSummaryView.swift
//  LoginValidation
//
//  Created by Liam Eun on 2023/02/23.
//

import SwiftUI

struct ValidationSummaryView: View {
    var errors: [LoginFormError]
    
    var body: some View {
        ForEach(errors, id: \.id) { error in
            Text(error.localizedDescription)
                .font(.caption)
        }
    }
}

struct ValidationSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ValidationSummaryView(errors: [])
    }
}
