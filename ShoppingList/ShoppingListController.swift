//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Nick Reichard on 2/17/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
    
    static let sharedController = ShoppingListController()
    
    let moc = Stack.context
    
    // MARK: - Create
    
    func addItem(item: String) {
        let _ = ShoppingList(item: item)
        saveToPersistentStore()
    }
    
    func completeButtonTapped(shoppingList item: ShoppingList) {
        
        item.isInCart = !item.isInCart
        saveToPersistentStore()
    }
    
    // MARK: - Read: Computed property will always run when playlist is called
    
    var itemsArray: [ShoppingList] {
        let request: NSFetchRequest<ShoppingList> = ShoppingList.fetchRequest()
        
        do {
            return try moc.fetch(request)
        } catch {
            return []
        }
    }
    
    // MARK: - Update
    
    // MARK: - Delete
    
    func remove(item: ShoppingList) {
        
        moc.delete(item)
        
        // Going to our Persisten Store - Deleting one less object
        saveToPersistentStore()
        
    }
    
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        
        do {
            try moc.save()
        } catch {
            print("Cannot save item to persistentStore")
        }
    
    }
    
    
}
