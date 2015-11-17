//
//  SettingsTableViewController.swift
//  PGChoiceViewController
//
//  Created by Piotr Gorzelany on 17/11/15.
//  Copyright © 2015 Piotr Gorzelany. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var sortOrderCell: UITableViewCell!
    
    @IBOutlet weak var sortByCell: UITableViewCell!
    
    @IBOutlet weak var studentCell: UITableViewCell!

    override func viewWillAppear(animated: Bool) {
        
        
        
        if let sortOrder = Settings.sortOrder?.description {
            sortOrderCell.detailTextLabel!.text = sortOrder
        }
        
        if let sortBy = Settings.sortBy?.description {
            sortByCell.detailTextLabel?.text = sortBy
        }
        
        if let student = Settings.student?.description {
            studentCell.detailTextLabel?.text = student
        }
        
    }
    
    let piotr = Student(name: "Piotr", surname: "Gorzelany")
    let john = Student(name: "John", surname: "Appleseed")
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let selectedCell = tableView.cellForRowAtIndexPath(indexPath) else {return}
        
        let choiceController: UITableViewController
        
        if selectedCell == sortOrderCell {
            
            let sortOrderChoices: [SortOrder] = [.Ascending, .Descending]
            let currentSortOrderChoice = Settings.sortOrder
            choiceController = PGChoiceViewController(choices: sortOrderChoices, currentChoice: currentSortOrderChoice, choiceHandler: { (sortOrder) -> Void in
                Settings.sortOrder = sortOrder
                self.navigationController?.popViewControllerAnimated(true)
            })
            
        } else if selectedCell == sortByCell {
            
            let sortByChoices: [SortBy] = [.Date, .Priority, .Title, .Progress, .Deadline]
            let currentSortByChoice = Settings.sortBy
            choiceController = PGChoiceViewController(choices: sortByChoices, currentChoice: currentSortByChoice, choiceHandler: { (sortBy) -> Void in
                Settings.sortBy = sortBy
                self.navigationController?.popViewControllerAnimated(true)
            })
            
        } else {
            
            // Student cell
            
            let studentChoice = [piotr, john]
            let currentStudentChoice = Settings.student
            choiceController = PGChoiceViewController(choices: studentChoice, currentChoice: currentStudentChoice, choiceHandler: { (student) -> Void in
                Settings.student = student
                self.navigationController?.popViewControllerAnimated(true)
            })
            
        }
        
        choiceController.title = selectedCell.textLabel?.text
        self.navigationController?.pushViewController(choiceController, animated: true)
        
    }
    
}
