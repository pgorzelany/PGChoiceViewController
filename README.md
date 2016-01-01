# PGChoiceViewController

fooooooooo

### Description

A subclass of UITableViewController that presents a simple UITableView with cells based on the passed items.
If a cell is tapped by the user, a handler is fired which takes the chosen item as its argument.
This view controller is very usefull for building settings screens like in the iPhone settings.
See test project and screenshots for examples.

### Instalation

Copy and paste the file PGChoiceViewController.swift to your project.

### Example Usage

![](http://i.imgur.com/JWma37Z.gif)

See the example project or example code below.

```
enum SortBy: String, CustomStringConvertible {

    case Date, Priority, Deadline, Title, Progress

    var description: String {
        return self.rawValue
    }
}

class MyViewController: UITableViewController {

  ...

  let sortByChoices: [SortBy] = [.Date, .Priority, .Title, .Progress, .Deadline]
  let currentSortByChoice = SortBy.sortBy

  func showSortByChoiceController() {
    let choiceController = PGChoiceViewController(choices: sortByChoices, currentChoice: currentSortByChoice, choiceHandler: { (sortBy) -> Void in
        self.currentSortByChoice = sortBy
        self.navigationController?.popViewControllerAnimated(true)
    })
    self.navigationController?.pushViewController(choiceController, animated: true)
  }


}

```
