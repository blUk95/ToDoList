//
//  MainViewToDoListItemView.swift
//  ToDoList
//
//  Created by Blaise Ohri on 30/06/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// view Model for list of items view
class MainViewToDoListItemView: ObservableObject {
    init() {}
    
    func toggleIsDone (item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
