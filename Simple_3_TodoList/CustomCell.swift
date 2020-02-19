//
//  CustomCell.swift
//  Simple_3_TodoList
//
//  Created by 飯島大樹 on 2020/02/19.
//  Copyright © 2020 Daiki Iijima. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var ViewLabel: UILabel!
    @IBOutlet weak var DoneButton: UIButton!
    
    @IBAction func OnClickDoneButton(_ sender: Any) {
        ViewLabel.text = inputField.text
        inputField.endEditing(true)
        inputField.isHidden = true
        DoneButton.isHidden = true
    }
    
}
