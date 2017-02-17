//
//  ItemCellTableViewCell.swift
//  ShoppingList
//
//  Created by Nick Reichard on 2/17/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class ItemCellTableViewCell: UITableViewCell {
    
    weak var delegate: isItemInCartTableViewCellDelegate?
    
    @IBOutlet weak var shoppingItemLable: UILabel!
    @IBOutlet weak var isInCartButton: UIButton!
    
    // MARK: - Action
    
    @IBAction func isInCartButtonTapped(_ sender: UIButton) {
        delegate?.completedButtonTapped(sender: self)
        print("TapedCustomButton")
    }
    
    
    private func updateViews() {
        guard let shoppingList = shoppingList else { return shoppingItemLable.text = "" }
        shoppingItemLable.text = shoppingList.item
        
        let isCompleteImage = shoppingList.isInCart ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        isInCartButton.setImage(isCompleteImage, for: .normal)
    }
    
    
    
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }
}

// To delegate handling a button tap to the TaskListTableViewController, adopt the protocol, and use the delegate method to mark the task as complete and reload the cell.

protocol isItemInCartTableViewCellDelegate: class {
    func completedButtonTapped(sender: ItemCellTableViewCell)
}
