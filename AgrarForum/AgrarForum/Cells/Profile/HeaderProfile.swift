//
//  TableViewCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/7/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class HeaderProfile: UITableViewCell {

    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
