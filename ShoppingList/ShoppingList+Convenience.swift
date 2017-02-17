//
//  ShoppingList+Convenience.swift
//  ShoppingList
//
//  Created by Nick Reichard on 2/17/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import CoreData

extension ShoppingList {
    
    @discardableResult convenience init(item: String, isInCart: Bool = false, context: NSManagedObjectContext = Stack.context) {
        
        // Generic properties. Blob of clay - that you mold into a face
        
        self.init(context: context)
        
        self.item = item
        self.isInCart = isInCart
        
    }
    
}
