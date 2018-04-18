//
//  ViewController.swift
//  com
//
//  Created by a103 on 18.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var eightThousandersPeaks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        eightThousandersPeaks += ["Mount Everest", "K2", "Kangchenjunga",
                                  "Lhotse","Makalu", "Cho Oyu",
                                  "Dhaulagiri","Manaslu", "Nanga Parbat",
                                  "Annapurna I", "Gasherbrum I", "Broad Peak",
                                  "Gasherbrum II", "Shishapangma"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eightThousandersPeaks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Trick to get static variable in Swift
        struct staticVariable { static var tableIdentifier = "TableIdentifier" }
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(
            withIdentifier: staticVariable.tableIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: staticVariable.tableIdentifier)
        }
        
        cell?.textLabel?.text = eightThousandersPeaks[indexPath.row]
        return cell!
    }
}

