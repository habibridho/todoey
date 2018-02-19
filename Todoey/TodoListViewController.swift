//
//  ViewController.swift
//  Todoey
//
//  Created by Habib Ridho on 19/01/18.
//  Copyright © 2018 Habib Ridho. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray: [String] = []
    let defaults = UserDefaults.standard
    let TODO_ARRAY_KEY = "TodoArray"

    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: TODO_ARRAY_KEY) as? [String] {
            itemArray = items
        }
    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - IBAction
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //Todo: add action
            guard let item = textField.text else {
                print("textField is empty")
                return
            }
            
            self.itemArray.append(item)
            self.defaults.set(self.itemArray, forKey: self.TODO_ARRAY_KEY)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

