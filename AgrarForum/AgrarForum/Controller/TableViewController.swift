//
//  ViewController.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/25/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var id: Int?
    var granted: String?
    static var Login:String?
    static var Password:String?
    var LoginCell: TextFieldCell?
    var PasswordCell: TextFieldCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        tableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        tableView.register(UINib(nibName: "LogoCell", bundle: nil), forCellReuseIdentifier: "LogoCell")
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        tableView.register(UINib(nibName: "RegistrationCell", bundle: nil), forCellReuseIdentifier: "RegistrationCell")
        tableView.backgroundView = UIImageView(image: UIImage(named: "LoginPage"))
        
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogoCell", for: indexPath) as! LogoCell

            let customFont = UIFont(name: "stheiti_medium.ttf", size: UIFont.systemFontSize)
            cell.label.font = customFont
            cell.label.textColor = UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
            
            return cell
        case 3:
            
            LoginCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell
            
            LoginCell?.textField.attributedPlaceholder = NSAttributedString(string: "Login",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)])
            LoginCell?.textField.textAlignment = NSTextAlignment.center
            
            
            LoginCell?.textField.layer.borderWidth = 1
            LoginCell?.textField.layer.borderColor = UIColor(red: 122/255, green: 158/255, blue: 176/255, alpha: 1).cgColor
            
            
            return LoginCell!
            
        case 5:
            PasswordCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell
            
            PasswordCell?.textField.attributedPlaceholder = NSAttributedString(string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)])
            PasswordCell?.textField.textAlignment = NSTextAlignment.center
            PasswordCell?.textField.isSecureTextEntry = true
            
            PasswordCell?.textField.layer.borderWidth = 1
            PasswordCell?.textField.layer.borderColor = UIColor(red: 122/255, green: 158/255, blue: 176/255, alpha: 1).cgColor
            
            
            return PasswordCell!
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.button.layer.cornerRadius = 15
            cell.trailingConstraint.constant = 88
            cell.leadingConstraint.constant = 88
            cell.button.addTarget(self, action: #selector(TableViewController.authorize), for: .touchUpInside)
    //            let myImage = UIImage(named: "LoginButton")
    //            cell.button.setImage(myImage, for: UIControl.State.normal)
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath) as! RegistrationCell
            
            cell.registerButton.addTarget(self, action: #selector(TableViewController.register), for: .touchUpInside)
           
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 2:
            return 75
        case 1:
            return 150
        case 3, 5:
            return 55
        case 4:
            return 22
        case 6:
            return 31
        case 7:
            return 60
        case 8:
            return 34
        case 9:
            return 100
        default:
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 9 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
            show(vc, sender: nil)
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @objc func register() {
//        self.performSegue(withIdentifier: "register", sender: self)
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        navigationController?.show(vc, sender: nil)
    }
    
    @objc func authorize(sender: UIButton) {
        TableViewController.Login = LoginCell?.textField.text!
        TableViewController.Password = PasswordCell?.textField.text!

        ApiHelper.shared.login(email:LoginCell!.textField.text!, password: PasswordCell!.textField.text!, success: { id_s in
            self.id = id_s.id
            self.granted = id_s.granted
            if(id_s.granted!.contains("1")) {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                vc.granted = self.granted
                vc.id = self.id
                self.navigationController?.show(vc, sender: nil)
            }
            else if(id_s.granted!.contains("0")) {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileUserVC") as! ProfileUserVC
                vc.granted = self.granted
//                vc.id = self.id

                self.navigationController?.show(vc, sender: nil)
            }
            
        }
            ,
            failure: { errorMessage in})
    }
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
}

