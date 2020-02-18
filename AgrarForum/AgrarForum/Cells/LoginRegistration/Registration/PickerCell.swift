//
//  PickerCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/4/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell {
    
    @IBOutlet weak var pickerText: UITextField!
    var pickerData: [String] = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reload(isChecked: Bool) {
        if isChecked {
            pickerText.isHidden = false
        } else {
            pickerText.isHidden = true
        }
    }
}
