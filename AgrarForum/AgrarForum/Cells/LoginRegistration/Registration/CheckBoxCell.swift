//
//  CheckBoxCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/30/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

protocol CheckBoxCellDelegate {
    func checkBoxSelection(isChecked: Bool)
}

class CheckBoxCell: UITableViewCell {
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    var delegate: CheckBoxCellDelegate?
    
    let checkedImage = UIImage(named: "checked_checkbox")!
    let uncheckedImage = UIImage(named: "unchecked_checkbox")!
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                checkBoxButton.setImage(checkedImage, for: .normal)
            } else {
                checkBoxButton.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkBoxButton.addTarget(self, action: #selector(self.buttonClicked), for: UIControl.Event.touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isChecked = false
        // Configure the view for the selected state
    }
    
    @objc func buttonClicked() {
        isChecked = !isChecked
        delegate?.checkBoxSelection(isChecked: isChecked)
    }
}
