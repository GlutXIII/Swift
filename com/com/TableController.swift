//
//  TableControllerTableViewController.swift
//  com
//
//  Created by a103 on 18.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import UIKit

class TableController: UITableViewController {

    var taskStore: TaskStore! {
        didSet {
            // Get data
            taskStore.tasks = TasksUtility.fetch() ?? [[Task](), [Task]()]
            
            // Reload table view
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func unwindToTasksController(segue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindToTaskController(_ sender: UIBarButtonItem) {
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        if(taskStore != nil){
        return taskStore.tasks.count
        }
        return 0;
    }
    
    // MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
}

// MARK: - Delegate
extension TableController {
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            
            // Determine whether the task 'isDone'
            guard let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone else { return }
            
            // Remove the task from the appropriate array
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            
            // Reload table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Indicate that the action was performed
            completionHandler(true)
            
        }
        
        deleteAction.image = #imageLiteral(resourceName: "Delete")
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.09019607843, blue: 0.2666666667, alpha: 1)
        
        return UISwipeActionsConfiguration(actions:[deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let doneAction = UIContextualAction(style: .normal, title: nil) { (action, sourceView, completionHandler) in
            
            // Toggle that the task is done
            self.taskStore.tasks[0][indexPath.row].isDone = true
            
            // Remove the task from the array containing todo tasks
            let doneTask = self.taskStore.removeTask(at: indexPath.row)
            
            // Reload table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Add the task from the array containing done tasks
            self.taskStore.add(doneTask, at: 0, isDone: true)
            
            // Reload table view
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            
            // Indicate the action was performed
            completionHandler(true)
            
        }
        
        doneAction.image = #imageLiteral(resourceName: "Done")
        doneAction.backgroundColor = #colorLiteral(red: 0, green: 0.9019607843, blue: 0.462745098, alpha: 1)
        
        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddTaskSegue" {
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}
