//
//  ViewController.swift
//  ToDoAppViper
//
//  Created by Никита Гундорин on 22.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit
import RealmSwift

protocol TableViewProtocol: class {
    func showTasks(tasks: Results<ToDoTask>)
}

class TableViewController: UITableViewController, AddTaskDelegate, ToDoTaskDelegate, TableViewProtocol {
    var presenter: PresenterProtocol!
    var configurator: ConfiguratorProtocol! = Configurator()
    var items: Results<ToDoTask>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count != 0 {
            return items.count + 1
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == items.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addTaskCell", for: indexPath) as! AddToDoTaskTableViewCell
            
            cell.delegate = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoTaskTableViewCell
        cell.delegate = self
        let item = items[indexPath.row]
        
        cell.label.text = item.title
        cell.checkbox.isChecked = item.isCompleted

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if (indexPath.row == items.count){
            return UITableViewCell.EditingStyle.none
        } else {
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            presenter.removeTask(task: items[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func showTasks(tasks: Results<ToDoTask>) {
        self.items = tasks
        tableView.reloadData()
    }
    
    func addToDoTask(toDoTaskTitle: String) {
        presenter.addTask(toDoTaskTitle: toDoTaskTitle)
        tableView.reloadData()
    }
    
    func toggleTaskCompleted(cell: ToDoTaskTableViewCell) {
        guard let index = self.tableView.indexPath(for: cell)?.row,
            let item = self.items?[index] else { return }
        presenter.toggleTaskCompleted(task: item)
        tableView.reloadData()
    }
}

