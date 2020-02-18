//
//  TextFieldCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/26/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
