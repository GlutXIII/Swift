//
//  ViewController.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights reserved.
//

import UIKit
var indexDecision = 0;
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listOdTodoList[indexOfListDecision].getList().count
       // if let todo = todoList{
      //  return todo.count
     //   }else{
    //        return 0
    //    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
     //   if let todo = todoList {
      //      cell.textLabel?.text = todo[indexPath.row]
   // }
        cell.textLabel?.text = listOdTodoList[indexOfListDecision].todoList[indexPath.row]
        return cell
}
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            listOdTodoList[indexOfListDecision].todoList.remove(at: indexPath.row)
            //todoList?.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexDecision = indexPath.row
        performSegue(withIdentifier: "showList", sender: self)
    }
}
