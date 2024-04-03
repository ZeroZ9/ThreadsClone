//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Long Tran M2 on 28/3/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
                
                Button(action: {
                    Task {
                        try await viewModel.createUser()
                    }
                }, label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 362, height: 44)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                Button(action: {
                    dismiss()
                }, label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    .font(.footnote)
                })
                .padding(.vertical,16)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
