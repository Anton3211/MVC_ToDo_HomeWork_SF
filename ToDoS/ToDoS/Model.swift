//
//  Model.swift
//  ToDoS
//
//  Created by Антон Паршин on 03.09.2021.
//

import Foundation
import UIKit


class Item {
    var string: String
    var checkMark: Bool
    
    init(string:String, checkMark:Bool){
        self.string = string
        self.checkMark = checkMark
    }
}


class Model {
    
    var addButtonPressed:Bool = false
    
    var todos:[Item] = [Item(string: "Сходить в магазин", checkMark: true),Item(string: "Забрать ребенка из школы", checkMark: false), Item(string: "Сходить в зал", checkMark: false)]
    //Создание данных
    func addItem(itemName:String, isCompleted: Bool = false) {
        todos.append(Item(string: itemName, checkMark: isCompleted))
    }
    //Удаление данных
    func removeItem(at index:Int){
        todos.remove(at: index)
    }
    
    func updateItem (at index:Int, with string:String) {
        todos[index].string = string
    }
    //Изменение состояния задачи
    func changeState(at item:Int) -> Bool{
        todos[item].checkMark = !todos[item].checkMark
        return todos[item].checkMark
    }
    

}
