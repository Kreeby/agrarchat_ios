//
//  SearchVC.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/17/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation
import UIKit

class SearchVC: UITableViewController, UITextFieldDelegate {
    var granted: String?
    var id_prof: String?
    var searchTxt: UITextField?
    var arrUsers = [User]()
    var names:[String] = Array()
    var namesList = [String]()
    var pos = [Int]()
    var counter = 1
    var id_p: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SALAM")
        tableView.register(UINib(nibName: "HeaderSearchCell", bundle: nil), forCellReuseIdentifier: "HeaderSearchCell")
        ApiHelper.shared.searchUsers(success: { usersList in
            self.arrUsers = usersList
            for str in self.arrUsers {
                self.names.append(str.username!)
                self.pos.append(str.id!)
            }
            self.tableView.register(UINib(nibName: "\(TitleAndDateCell.self)", bundle: nil), forCellReuseIdentifier: "TitleAndDateCell")
            self.tableView.reloadData()
            
            
            
            
            
        }, failure: { errorMessage in
            
        })
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.sectionHeaderHeight = 140
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderSearchCell") as! HeaderSearchCell
        
        
        searchTxt = cell.textField
        
        cell.textField.becomeFirstResponder()
        cell.textField.addTarget(self, action: #selector(SearchControl), for: .editingChanged)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(counter == 1) {
            return arrUsers.count
        }
        return self.namesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDateCell", for: indexPath) as! TitleAndDateCell
        
        if(counter == 1) {
            cell.title.text = arrUsers[indexPath.row].username
            
        }
        else {
            cell.title.text = namesList[indexPath.row]
            
        }
        cell.date.text = arrUsers[indexPath.row].category
        
        cell.circle.layer.cornerRadius = cell.circle.frame.width/2
        cell.circle.layer.borderWidth = 1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(arrUsers[indexPath.row])
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        vc.granted = self.granted
        print(pos[indexPath.row])
        id_p = pos[indexPath.row]
        vc.id = id_p
        
        self.navigationController?.show(vc, sender: nil)
        
    }
    @objc func SearchControl() {
        
        let searchText = searchTxt?.text
        namesList.removeAll()
        pos.removeAll()
        
        if searchText == "" || searchText == " " {
            print("empty search")
            counter = 1
            tableView.reloadData()
            
        }
        
        
        
        
        for item in names {
            
            let text = searchText!.lowercased()
            let isArrayContain = item.lowercased().range(of:text)

            if isArrayContain != nil {
                print("success")
                counter+=1
                namesList.append(item)
                pos.append(names.firstIndex(of: item)!)
                print(pos)
                tableView.reloadData()
                if(searchText == "") {
                    namesList.removeAll()
                    pos.removeAll()
                }
            }
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
}
