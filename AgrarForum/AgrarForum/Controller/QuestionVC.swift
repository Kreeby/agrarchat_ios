//
//  QuestionVC.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/26/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class QuestionVC: UITableViewController {

    var arrQuestions = [TitleAndDate]()
    
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "QuestionsHeaderCell", bundle: nil), forCellReuseIdentifier: "QuestionsHeaderCell")
        ApiHelper.shared.getQuestionList(id: id!, success: { questonList in
            self.arrQuestions = questonList
            self.tableView.register(UINib(nibName: "\(TitleAndDateCell.self)", bundle: nil), forCellReuseIdentifier: "TitleAndDateCell")
            self.tableView.reloadData()
            
        }, failure: { errorMessage in
            
        })
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.sectionHeaderHeight = 140
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsHeaderCell") as! QuestionsHeaderCell
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrQuestions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDateCell", for: indexPath) as! TitleAndDateCell
        
        cell.title.text = arrQuestions[indexPath.row].text
        cell.date.text = arrQuestions[indexPath.row].created_at
        
        cell.circle.layer.cornerRadius = cell.circle.frame.width/2
        cell.circle.layer.borderWidth = 1
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    var heightConstraint:CGFloat = 120.0

    var lastContentOffset: CGFloat = 0.0
    let maxHeaderHeight: CGFloat = 115.0


}
