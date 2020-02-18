//
//  LogoCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/25/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class LogoCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
