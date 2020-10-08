//
//  QuestionSelf.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 4/27/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class QuestionSelf: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var button: UIButton!
    var granted: String?
    var id: Int?
    var arrQuestions:[String]? = Array()
    var arrAnswer: [String]? = Array()
    var isReloaded: Bool = false
    var arrElements: QuestionAndAnswer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
        
        tableView.register(UINib(nibName: "QuestionsHeaderCell", bundle: nil), forCellReuseIdentifier: "QuestionsHeaderCell")
                     
        tableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        tableView.register(UINib(nibName: "SualLabelCell", bundle: nil), forCellReuseIdentifier: "SualLabelCell")
        tableView.backgroundView = UIImageView(image: UIImage(named: "questionBack"))
        
                ApiHelper.shared.isAnswer(id: id!, success: { qa in
                    print("I AM SENDING...")
                    self.arrElements = qa
                    
                    
                    self.tableView.reloadData()
                    
                }
                            
                    , failure: {
                        errorMessage in
                })
        
        
      
        
        
        
        
        if(granted == "1") {
            self.button?.isEnabled = false
            self.button?.isHidden = true
        }
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 6
       }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("I AM GIVING...")
        switch indexPath.row {
        
       
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsHeaderCell", for: indexPath) as! QuestionsHeaderCell
            cell.backgroundColor = .clear
            
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            cell.backgroundColor = .clear
            cell.elementText.backgroundColor = .gray
            cell.elementText.layer.cornerRadius = 10
            
            cell.elementText?.text = arrElements?.question[0].text!
            
//            arrElements?.question[0].image!)!
            
            ApiHelper.shared.getImageByURL("http://localhost:8000/uploads/images/store/D2668E10-2F07-4260-80F4-2CDDD39FC161.jpeg") { result in
                switch result {
                case .success(let image):
                    cell.imageOfQuestion.image = image
                case .failure(let error):
                    print("SOSU XUY")
                }
            }
            
            
            
            return cell
        case 2, 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SualLabelCell", for: indexPath) as! SualLabelCell
            cell.labelText.text = "Mutəxəssisin Cavabı"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
            cell.backgroundColor = .clear
            cell.elementText.backgroundColor = .gray
            cell.elementText.layer.cornerRadius = 10
            if(arrElements?.answer.isEmpty == true) {
                cell.elementText.text = "Nothing here..."
            }
            else {
                cell.elementText.text = arrElements?.answer[0].text
            }
            
            
//
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 140
        case 1:
            return 200
        case 5:
            return 130
        case 2, 4:
            return 52
        case 3:
            return 50
        default:
            return 50
        }
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.tableView.reloadData()
//    }
}

//extension UIButton{
//    func roundedButton(){
//        let maskPath1 = UIBezierPath(roundedRect: bounds,
//                                     byRoundingCorners: [.topLeft , .topRight],
//                                     cornerRadii: CGSize(width: 25, height: 25))
//        let maskLayer1 = CAShapeLayer()
//        maskLayer1.frame = bounds
//        maskLayer1.path = maskPath1.cgPath
//        layer.mask = maskLayer1
//    }
//}
