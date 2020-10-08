//
//  QuestionFormVC.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/25/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation
import UIKit


class QuestionFormVC: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var urlImage: String?
    var image: UIImage?
    var data: NSData?
    let defaultimg = UIImage()
    var id_self: Int?
    var granted: String?
    static var QuestionField: String?
    var QuestionCell: QuestionTextFieldCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        tableView.register(UINib(nibName: "QuestionFormCell", bundle: nil), forCellReuseIdentifier: "QuestionFormCell")
        tableView.register(UINib(nibName: "SualLabelCell", bundle: nil), forCellReuseIdentifier: "SualLabelCell")
        tableView.register(UINib(nibName: "QuestionTextFieldCell", bundle: nil), forCellReuseIdentifier: "QuestionTextFieldCell")
        tableView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        tableView.backgroundView = UIImageView(image: UIImage(named: "QuestionForm"))
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0, 2, 4, 6, 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SualLabelCell", for:indexPath) as! SualLabelCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionFormCell", for:indexPath) as! QuestionFormCell
            cell.trailingConstraint.constant = 60
            cell.leadingConstraint.constant = 60
            cell.button.layer.cornerRadius = 15
            cell.button.layer.borderWidth = 1
            cell.button.layer.borderColor = UIColor.black.cgColor
            cell.button.setTitle("Sualın mövzusu", for: .normal)
            cell.button.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5), for: .normal)
            cell.selectPhoto.image = UIImage(named: "LoginArrowDown")
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionFormCell", for:indexPath) as! QuestionFormCell
            cell.trailingConstraint.constant = 60
            cell.leadingConstraint.constant = 60
            cell.button.layer.cornerRadius = 15
            cell.button.layer.borderWidth = 1
            cell.button.layer.borderColor = UIColor.black.cgColor
            cell.button.setTitle("Upload video or photo...", for: .normal)
            cell.button.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5), for: .normal)
            cell.selectPhoto.image = UIImage(named: "photo")
            
            
            cell.button.addTarget(self, action: #selector(QuestionFormVC.importImage), for: .touchUpInside)
            return cell
        case 7:
            QuestionCell = tableView.dequeueReusableCell(withIdentifier: "QuestionTextFieldCell", for:indexPath) as? QuestionTextFieldCell
            
            
            QuestionCell?.questionTF.layer.borderWidth = 1
            QuestionCell?.questionTF.layer.borderColor = UIColor.black.cgColor
            
            QuestionCell?.trailingConst.constant = 60
            QuestionCell?.leadingConst.constant = 60
            
            QuestionCell?.questionTF.placeholder = "Sualınız..."
            
            
            return QuestionCell!
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.button.layer.cornerRadius = 15
            cell.button.setTitle("POST", for: .normal)
            cell.trailingConstraint.constant = 88
            cell.leadingConstraint.constant = 88
            cell.button.addTarget(self, action: #selector(QuestionFormVC.addQuestion), for: .touchUpInside)
            //            let myImage = UIImage(named: "LoginButton")
            //            cell.button.setImage(myImage, for: UIControl.State.normal)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 45
        case 1:
            return 40
        case 2, 4, 6:
            return 40
        case 3, 5:
            return 40
        case 7:
            return 214
        case 8:
            return 56
        case 9:
            return 60
        default:
            return 50
        }
        
    }
    
    @objc func importImage(sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = true
        present(image, animated: true, completion: nil)
        print("HELLO WORLD")
    }
    
    @objc func addQuestion(sender: UIButton) {
        QuestionFormVC.QuestionField = QuestionCell?.questionTF.text
        ApiHelper.shared.addQuestion(image: self.image ?? defaultimg, imageName: self.urlImage ?? "NO", category: "category", added_to: id_self!,text: QuestionFormVC.QuestionField ?? "NO QUESTION",  success: {
                   
                
                    
                }
                    ,
                    failure: { errorMessage in})
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as! QuestionVC
        vc.granted = self.granted
                       
        vc.id = self.id_self
        self.navigationController?.show(vc, sender: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.image = image
            }
            let imgName = imgUrl.lastPathComponent
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            let localPath = documentDirectory?.appending(imgName)
            
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            data = image.pngData()! as NSData
            data!.write(toFile: localPath!, atomically: true)
            //let imageData = NSData(contentsOfFile: localPath!)!
            let photoURL = URL.init(fileURLWithPath: localPath!) //NSURL(fileURLWithPath: localPath!)
            
            urlImage = imgName
            
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
        print(pickedImage!)
    }
    
    
}

extension UITextField{
    func roundedTF(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .topRight],
                                     cornerRadii: CGSize(width: 25, height: 25))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
