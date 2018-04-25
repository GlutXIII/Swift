//
//  AddTaskViewController.swift
//  com
//
//  Created by a103 on 25.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var TitleText: UITextField!
    @IBOutlet weak var DescriptionText: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "BackToVC" {
            
            let tasksController = segue.destination as! TableController
            guard let name = TitleText?.text else { return }
            let newTask = Task(name: name)
            
            tasksController.taskStore.add(newTask, at: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SaveButton.isEnabled = false
        TitleText.delegate = self
        DescriptionText.delegate = self
    }
    
    // saveButton doesn't disable after deleting all text in taskName -- FIX THIS
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = ((TitleText.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        let text2 = ((DescriptionText.text ?? "") as NSString).replacingCharacters(in:range, with: string)
        SaveButton.isEnabled = (!text.isEmpty && !text2.isEmpty)
        return true
    }

}
