//
//  ToDoSVC.swift
//  ToDoS
//
//  Created by Anton on 02.09.2021.
//

import UIKit

class ToDoSVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let model = Model()
    
    var alert = UIAlertController()
    
    
    @IBOutlet weak var toDoTableView: UITableView!
    
    @objc func alertTextFieldDidChange(_ sender:UITextField){
        guard let senderText = sender.text, alert.actions.indices.contains(1) else {
            return
        }

        let action = alert.actions[1]
        action.isEnabled = senderText.count > 0
    }
    
    @IBAction func addToDo(_ sender: Any) {
        
        alert = UIAlertController(title: "Добавить новую заметку", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "Ваша заметка"
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
        }
        let addAlertAction = UIAlertAction(title: "Добавить", style: .default){
            (createAlert) in
            
            guard let addTextFieldValue = self.alert.textFields?[0].text else {
                return
            }
            self.model.addItem(itemName: addTextFieldValue)
            self.toDoTableView.reloadData()
        }
        
        let cancelAlertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(cancelAlertAction)
        alert.addAction(addAlertAction)
        present(alert, animated: true, completion: nil)
        addAlertAction.isEnabled = false
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        toDoTableView.rowHeight = 50
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ToDoCell
        
        let currentItem = model.todos[indexPath.row]
        cell.toDoLabel?.text = currentItem.string
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ToDoCell
        
        if cell.isChecked == false {
            cell.checkmarkImage.image = UIImage(systemName: "checkmark.circle")
            cell.isChecked = true
        } else {
            cell.checkmarkImage.image = nil
            cell.isChecked = false
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        model.todos.remove(at: indexPath.row)
        toDoTableView.reloadData()
    }
    

}
