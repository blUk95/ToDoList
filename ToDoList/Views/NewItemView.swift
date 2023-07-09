//
//  NewItemView.swift
//  ToDoList
//
//  Created by Blaise Ohri on 30/06/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = MainViewNewItemView()
    @Binding var NewItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TDLButton(
                    title: "Save",
                    background: .pink
                ) {
                    if viewModel.canSave {
                        viewModel.save()
                        NewItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                        
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer.")
                )
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(NewItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
