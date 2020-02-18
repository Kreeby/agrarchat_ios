//
//  ProfileVC.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/11/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation
import UIKit

class ProfileUserVC: UITableViewController {
    
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "HeaderProfile", bundle: nil), forCellReuseIdentifier: "HeaderProfile")
        tableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        tableView.register(UINib(nibName: "ProfileButton", bundle: nil), forCellReuseIdentifier: "ProfileButton")
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        
        self.view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderProfile", for: indexPath) as! HeaderProfile
            cell.position.text = "Istifadəçi"
            return cell
        case 1, 3, 5, 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileButton", for: indexPath) as! ProfileButton
            cell.button.setTitle("Mütəxəssis axtar", for: .normal)
            cell.trailinConst.constant = 88
            cell.leadingConst.constant = 88
            cell.button.layer.cornerRadius = 15
            cell.button.layer.borderWidth = 1
            cell.button.layer.borderColor = UIColor.black.cgColor
            
            cell.button.addTarget(self, action: #selector(ProfileUserVC.searchUsers), for: .touchUpInside)
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
            cell.infoImage.image = UIImage(named: "phone")
            cell.infoName.text = "+994lorem"
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
            cell.infoImage.image = UIImage(named: "email")
            cell.infoName.text = "loremipsum@gmail.com"
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    @objc func searchUsers(sender: UIButton) {
        
            let vc = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
            
            navigationController?.show(vc, sender: nil)
            
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 238
        case 1:
            return 25
        case 2:
            return 46
        case 3:
            return 39
        case 4, 6:
            return 45
        case 5,7:
            return 40
        default:
            return 50
        }
    }
    
}
