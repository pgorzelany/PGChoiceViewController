//
//  LCChoiceTableViewController.swift
//
//  Created by Piotr Gorzelany on 17/11/15.
//  Copyright Â© 2015 Piotr Gorzelany. All rights reserved.
//

import UIKit

class PGChoiceViewController<Item where Item: CustomStringConvertible, Item: Equatable>: UITableViewController {
    
    typealias ChoiceHandler = (Item) -> Void
    
    /** Available choices */
    let choices: [Item]
    
    /** Optional currently choosen item. There will be a checkmark on the cell with this item */
    let currentChoice: Item?
    
    /** The completion handler which is fired after the user chooses an option */
    let choiceHandler: ChoiceHandler
    
    
    /**
     Initializes the default ChoiceViewController which is a subclass of UITableViewController
     - parameter choices: Available choices
     - parameter currentChoice: Optional currently choosen item. There will be a checkmark on the cell with this item
     - parameter choiceHandler: The completion handler which is fired after the user chooses an option
     */
    init(choices: [Item], currentChoice: Item?, choiceHandler: ChoiceHandler) {
        self.choices = choices
        self.currentChoice = currentChoice
        self.choiceHandler = choiceHandler
        super.init(style: UITableViewStyle.Grouped)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choices.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ItemCell")
        let item = choices[indexPath.row]
        cell.textLabel?.text = item.description
        cell.accessoryType = UITableViewCellAccessoryType.None
        if let currentChoice = currentChoice {
            if item == currentChoice {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = choices[indexPath.row]
        self.choiceHandler(item)
    }
    
}
