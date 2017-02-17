//
//  Sack.swift
//  ShoppingList
//
//  Created by Nick Reichard on 2/17/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    
    // The Stack sets up the whole NSPersistentContainer. Whole enchelada
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
