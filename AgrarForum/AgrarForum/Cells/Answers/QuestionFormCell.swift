//
//  QuestionFormCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/25/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class QuestionFormCell: UITableViewCell {

    
    @IBOutlet weak var selectPhoto: UIImageView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
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
