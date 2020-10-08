//
//  QuestionVC.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/26/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class QuestionVC: UITableViewController {
    
    @IBOutlet weak var button: UIButton!
    var arrQuestions = [TitleAndDate]()
    var arrElements: QuestionAndAnswer?
    var id: Int?
    var pos = [Int]()
    var granted: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.roundedButton()
        button.addTarget(self, action: #selector(QuestionVC.askQuestion), for: .touchUpInside)
        button.setTitle("Yeni sual ver", for: .normal)
        tableView.register(UINib(nibName: "QuestionsHeaderCell", bundle: nil), forCellReuseIdentifier: "QuestionsHeaderCell")
        tableView.register(UINib(nibName: "QuestionsFooterCell", bundle: nil), forCellReuseIdentifier: "QuestionsFooterCell")
        ApiHelper.shared.getQuestionList(id: id!, success: { questonList in
            
            self.arrQuestions = questonList
            self.tableView.register(UINib(nibName: "\(TitleAndDateCell.self)", bundle: nil), forCellReuseIdentifier: "TitleAndDateCell")
            self.tableView.reloadData()
            
        }, failure: { errorMessage in
            
        })
        
        if(granted == "1") {
            self.button.isEnabled = false
            self.button.isHidden = true
        }
        
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id_p = arrQuestions[indexPath.row].id
        
        
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionSelf") as! QuestionSelf
        vc.granted = self.granted
        print(arrElements)
        vc.arrElements = arrElements
        vc.id = id_p
        navigationController?.show(vc, sender: nil)
    }
    
    var heightConstraint:CGFloat = 120.0
    
    var lastContentOffset: CGFloat = 0.0
    let maxHeaderHeight: CGFloat = 115.0
    
    @objc func askQuestion(sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionFormVC") as! QuestionFormVC
        
        
        vc.id_self = self.id
        vc.granted = self.granted
        navigationController?.show(vc, sender: nil)
    }

}


extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .topRight],
                                     cornerRadii: CGSize(width: 25, height: 25))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}


