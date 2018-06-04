//
//  DetailsController.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var taskTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitle.text = listOdTodoList[indexOfListDecision].todoList[indexDecision]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
