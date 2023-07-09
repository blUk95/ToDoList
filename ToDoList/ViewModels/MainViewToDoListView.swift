//
//  MainViewToDoListView.swift
//  ToDoList
//
//  Created by Blaise Ohri on 30/06/2023.
//

import FirebaseFirestore
import Foundation

class MainViewToDoListView: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
