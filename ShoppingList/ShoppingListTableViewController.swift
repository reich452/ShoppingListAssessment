//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Nick Reichard on 2/17/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, isItemInCartTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "I Love Bacon Shopping List "
    }
    
    // MARK: - Alerts
    
    @IBAction func addItemButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your shopping list", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        var shoppingListTextField: UITextField?
        alertController.addTextField { (textField) in
            shoppingListTextField = textField
        }
        
        let addShoppingListAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let shoppingListItem = shoppingListTextField?.text else { return }
            ShoppingListController.sharedController.addItem(item: shoppingListItem)
            
            self.tableView.reloadData()
        }
        
        alertController.addAction(addShoppingListAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ShoppingListController.sharedController.itemsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemCellTableViewCell else { return ItemCellTableViewCell() }
        
        let shoppingList = ShoppingListController.sharedController.itemsArray[indexPath.row]
        
        cell.shoppingList = shoppingList
        cell.delegate = self
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let shoppingList = ShoppingListController.sharedController.itemsArray[indexPath.row]
            ShoppingListController.sharedController.remove(item: shoppingList)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // MARK: - Delegate Protocol Properties
    
    func completedButtonTapped(sender: ItemCellTableViewCell) {
        
        guard let shoppingListItem = sender.shoppingList, let indexPath = tableView.indexPath(for: sender) else { return }
        
        ShoppingListController.sharedController.completeButtonTapped(shoppingList: shoppingListItem)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    
    
}




