//
//  AddController.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights reserved.
//

import UIKit

class AddController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPresed(_ sender: UIButton) {
        if (textField.text != nil) && textField.text != "" {
            todoList?.append(textField.text!)
             listOdTodoList[indexOfListDecision].addTask(task: textField.text!)
            textField.text = ""
            textField.placeholder = "Type more"
           
        }
        
        
    }
}
