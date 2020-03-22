//
//  ToDoTaskTableViewCell.swift
//  ToDoAppViper
//
//  Created by Никита Гундорин on 22.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit

protocol ToDoTaskDelegate {
    func toggleTaskCompleted(cell: ToDoTaskTableViewCell)
}

class ToDoTaskTableViewCell: UITableViewCell {
    
    var delegate: ToDoTaskDelegate?
    
    @IBOutlet weak var checkbox: ToDoCheckbox!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func checkboxTriggered(_ sender: Any) {
        delegate?.toggleTaskCompleted(cell: self)
        checkbox.isChecked = !checkbox.isChecked
    }
}
