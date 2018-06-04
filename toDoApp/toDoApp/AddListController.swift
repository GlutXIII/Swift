//
//  AddListController.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights reserved.
//

import UIKit

var indexOfListDecision = 0

class AddListController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func addAction(_ sender: UIButton) {
        var bigList = BigList()
        
        bigList.setName(name: textField.text!)
        bigList.setList(todo: [])
        textField.text = ""
        textField.placeholder = "Dodaj wiecej"
        listOdTodoList.append(bigList)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
