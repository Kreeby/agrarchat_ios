//
//  ProfileButton.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/7/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class ProfileButton: UITableViewCell {

    
    @IBOutlet weak var trailinConst: NSLayoutConstraint!
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    @IBOutlet weak var leadingConst: NSLayoutConstraint!
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
