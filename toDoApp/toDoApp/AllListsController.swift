//
//  ListOdListsController.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights re/Users/mikepolak/Desktop/toDoApp/toDoApp/AddListController.swiftserved.
///Users/mikepolak/Desktop/toDoApp/toDoApp/AddListController.swift

import UIKit

class AllListsController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = allLists[indexPath.row].getName()
        return cell
        
    }

    @IBOutlet weak var listOfList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOfList.delegate = self
        listOfList.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(allLists.count>0){
            print(allLists[0].getName())
        }
        listOfList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moveToCurrent = moveToCurrentFunc(at : indexPath)
        return UISwipeActionsConfiguration(actions: [moveToCurrent])
    }
    
    func moveToCurrentFunc(at indexPath:IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "MoveToCurrent") {(action,view,completion) in
            listOdTodoList.append(allLists[indexPath.row])
            allLists.remove(at:indexPath.row)
            self.listOfList.reloadData()
            completion(true)
        }
        action.image = #imageLiteral(resourceName: "Check")
        action.backgroundColor = .green
        return action
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{

            allLists.remove(at: indexPath.row)
            //todoList?.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

