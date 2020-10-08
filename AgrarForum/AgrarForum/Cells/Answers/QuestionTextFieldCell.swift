//
//  QuestionTextFieldCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/25/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class QuestionTextFieldCell: UITableViewCell {

    @IBOutlet weak var questionTF: UITextField!
    @IBOutlet weak var trailingConst: NSLayoutConstraint!
    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
