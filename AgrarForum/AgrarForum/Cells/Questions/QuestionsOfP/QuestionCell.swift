//
//  QuestionCell.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 4/27/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var elementText: UITextView!
    @IBOutlet weak var imageOfQuestion: UIImageView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        elementText.delegate = self
        elementText.translatesAutoresizingMaskIntoConstraints = false
        [
            elementText.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            elementText.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            elementText.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            elementText.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ].forEach {
                $0.isActive = true
        }
        elementText.isScrollEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
