//
//  ToDoCell.swift
//  ToDoS
//
//  Created by Anton on 02.09.2021.
//

import UIKit




class ToDoCell: UITableViewCell {


    
    @IBOutlet weak var toDoLabel: UILabel!
    
    @IBOutlet weak var checkmarkImage: UIImageView!
    
    var isChecked = false
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
