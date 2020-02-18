//
//  InfoCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/7/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
