//
//  LogInView.swift
//  ToDoList
//
//  Created by Blaise Ohri on 30/06/2023.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LogInViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)

                // Login Form
                
        
                Form{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TDLButton(
                        title: "Log In",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                            .padding()
                    
                }
                .offset(y:-50)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",destination: RegisterView())
                    // Show registration
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
