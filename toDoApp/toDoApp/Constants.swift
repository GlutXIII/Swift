//
//  Constants.swift
//  toDoApp
//
//  Created by Michal Kalas on 01.06.2018.
//  Copyright © 2018 piotrek. All rights reserved.
//

import Foundation

var todoList:[String]?

var allLists:[BigList] = []

var listOdTodoList:[BigList] = []

func saveData(todoList:[String]){
    UserDefaults.standard.set(todoList, forKey: "todoList")
}

func fetchData() -> [String]?{
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String]{
        return todo
    }else{
        return nil
    }
}

class BigList : NSObject {
    var movedToAllWhenDone :Bool = true;
    var todoList:[String] = []
    var name:String = ""
    
    func getList() -> [String]{
        return self.todoList
    }
    
    func setList(todo:[String]){
        self.todoList = todo;
    }
    
    func getName() -> String{
        return name
    }
    func setName(name:String){
        self.name = name
    }
    
    func addTask(task:String){
        
        self.todoList.append(task)
    }
}
