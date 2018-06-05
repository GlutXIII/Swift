//
//  ListOdListsController.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights re/Users/mikepolak/Desktop/toDoApp/toDoApp/AddListController.swiftserved.
///Users/mikepolak/Desktop/toDoApp/toDoApp/AddListController.swift

import UIKit

class ListOdListsController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOdTodoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
     
            cell.textLabel?.text = listOdTodoList[indexPath.row].getName()
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
        if(listOdTodoList.count>0){
        print(listOdTodoList[0].getName())
        }
        listOfList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let important = importantAction(at: indexPath)
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete,important])
    }
    
    func importantAction(at indexPath: IndexPath) -> UIContextualAction{
        let chosenToDoList = listOdTodoList[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Important"){ (action,view,completion) in
            chosenToDoList.movedToAllWhenDone = !chosenToDoList.movedToAllWhenDone
            completion(true)
        }
        action.image = #imageLiteral(resourceName: "Alarm")
        action.backgroundColor = chosenToDoList.movedToAllWhenDone ? .blue : .gray
        return action
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete"){ (action,view,completion) in
            if(listOdTodoList[indexPath.row].movedToAllWhenDone){
                allLists.append(listOdTodoList[indexPath.row])
            }
            listOdTodoList.remove(at: indexPath.row)
            self.listOfList.reloadData()
            completion(true)
            }
        action.image = #imageLiteral(resourceName: "Trash")
        action.backgroundColor = .red
        return action
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexOfListDecision = indexPath.row
        performSegue(withIdentifier: "showListOfList", sender: self)
    }
    
 //   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
  //      if editingStyle == .delete{
 //           if(listOdTodoList[indexPath.row].movedToAllWhenDone){
 //               allLists.append(listOdTodoList[indexPath.row])
  //          }
  //          listOdTodoList.remove(at: indexPath.row)
            //todoList?.remove(at: indexPath.row)
  //          tableView.reloadData()
 //       }
 //   }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
