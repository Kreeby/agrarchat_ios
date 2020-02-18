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
    
    var searchTxt: UITextField?
    var arrUsers = [User]()
    var names:[String] = Array()
    var filterList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HeaderSearchCell", bundle: nil), forCellReuseIdentifier: "HeaderSearchCell")
        ApiHelper.shared.searchUsers(success: { usersList in
            self.arrUsers = usersList
            self.tableView.register(UINib(nibName: "\(TitleAndDateCell.self)", bundle: nil), forCellReuseIdentifier: "TitleAndDateCell")
            self.tableView.reloadData()
            
            for str in self.arrUsers {
                self.names.append(str.username!)
            }
            
            
            
        }, failure: { errorMessage in
            
        })
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.sectionHeaderHeight = 120
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderSearchCell") as! HeaderSearchCell
        
        searchTxt = cell.textField
        
        cell.textField.addTarget(self, action: #selector(SearchControl), for: .editingChanged)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDateCell", for: indexPath) as! TitleAndDateCell
        
        cell.title.text = arrUsers[indexPath.row].username
        cell.date.text = arrUsers[indexPath.row].category
        
        cell.circle.layer.cornerRadius = cell.circle.frame.width/2
        cell.circle.layer.borderWidth = 1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @objc func SearchControl() {
        let searchText = searchTxt?.text
        filterList.removeAll()
        print(searchText as Any)
        
        if searchText == "" || searchText == " " {
            print("empty search")
            filterList.removeAll()
            return
        }
        
        
        
        
        for item in names {
            
            let text = searchText!.lowercased()
            let isArrayContain = item.lowercased().range(of:text)

            if isArrayContain != nil {
                print("success")
                filterList.append(item)
                if(searchText == "") {
                    filterList.removeAll()
                }
            }
        }
        
        print(filterList)
    }
}
