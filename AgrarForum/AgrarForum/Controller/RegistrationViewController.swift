//
//  RegistrationViewController.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 1/28/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    private var isChecked = false
    var textField: UITextField!
    var selectedCountry: String?
    var countryList = ["Bitkiçilik", "Heyvandarlıq", "Texnika", "Digər"]
        
    static var Email:String?
    static var Username:String?
    static var Password:String?
    
    var EmailCell: TextFieldCell?
    var UsernameCell: TextFieldCell?
    var PasswordCell: TextFieldCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        tableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        tableView.register(UINib(nibName: "AgrarForumLabelCell", bundle: nil), forCellReuseIdentifier: "AgrarForumLabelCell")
        tableView.register(UINib(nibName: "RegistrationLabel", bundle: nil), forCellReuseIdentifier: "RegistrationLabel")
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib(nibName: "CheckBoxCell", bundle: nil), forCellReuseIdentifier: "CheckBoxCell")
        tableView.register(UINib(nibName: "PickerCell", bundle: nil), forCellReuseIdentifier: "PickerCell")
        tableView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        tableView.backgroundView = UIImageView(image: UIImage(named: "LoginPage"))
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AgrarForumLabelCell", for: indexPath) as! AgrarForumLabelCell
            
            return cell
        case 1, 3, 5, 7, 9, 11, 13:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationLabel", for: indexPath) as! RegistrationLabel
            return cell
            
        case 4:
            EmailCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell
            EmailCell?.textField.textAlignment = NSTextAlignment.center
            EmailCell?.textField.attributedPlaceholder = NSAttributedString(string: "E-mail",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)])
            
            EmailCell?.textField.layer.borderWidth = 1
            EmailCell?.textField.layer.borderColor = UIColor(red: 122/255, green: 158/255, blue: 176/255, alpha: 1).cgColor
            return EmailCell!
        case 6:
            UsernameCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell
            UsernameCell?.textField.textAlignment = NSTextAlignment.center
            UsernameCell?.textField.attributedPlaceholder = NSAttributedString(string:
                "Username",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)])
            UsernameCell?.textField.layer.borderWidth = 1
            UsernameCell?.textField.layer.borderColor = UIColor(red: 122/255, green: 158/255, blue: 176/255, alpha: 1).cgColor
            return UsernameCell!
        case 8:
            PasswordCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldCell
            //            cell.backgroundColor = .red
            PasswordCell?.textField.textAlignment = NSTextAlignment.center
            PasswordCell?.textField.attributedPlaceholder = NSAttributedString(string:
                "Password",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)])
            PasswordCell?.textField.isSecureTextEntry = true
            
            PasswordCell?.textField.layer.borderWidth = 1
            PasswordCell?.textField.layer.borderColor = UIColor(red: 122/255, green: 158/255, blue: 176/255, alpha: 1).cgColor
            return PasswordCell!
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath) as! CheckBoxCell
            cell.delegate = self
            
            return cell
        case 12:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PickerCell", for: indexPath) as! PickerCell
            cell.reload(isChecked: isChecked)
            
            textField = cell.pickerText
            
            return cell
            
        case 14:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.button.layer.cornerRadius = 15
            cell.trailingConstraint.constant = 88
            cell.leadingConstraint.constant = 88
            
            cell.button.addTarget(self, action: #selector(RegistrationViewController.register), for: .touchUpInside)
            
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        case 1:
            return 32
        case 2:
            return 35
        case 3:
            return 40
        case 4, 6, 8:
            return 52
        case 5, 7:
            return 24
        case 9:
            return 30
        case 10:
            return 60
        case 11:
            return 15
        case 12:
            return 60
        case 13:
            return 60
        case 14:
            return 60
        default:
            return 50
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row] // selected item
        textField.text = selectedCountry
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textField.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    
    @objc func action() {
        view.endEditing(true)
    }
    
    @objc func register() {
        
//        if(textField.text!.isEmpty) {
//            RegistrationViewController.isChecked = false
//        }
//        else {
//            RegistrationViewController.isChecked = true
//        }
        RegistrationViewController.Email = EmailCell?.textField.text!
        RegistrationViewController.Username = UsernameCell?.textField.text!
        RegistrationViewController.Password = PasswordCell?.textField.text!
        
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache"
        ]
        
        let parameters = ["username": RegistrationViewController.Username!,
                          "password": RegistrationViewController.Password!,
                          "email": RegistrationViewController.Email!,
                          "granted" : isChecked,
                          "category": textField.text!
            
            ] as [String : Any]
        
        let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        if let data = postData {
            let request = NSMutableURLRequest(url: NSURL(string: "http://192.168.73.151:8000/register")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = data as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error?.localizedDescription ?? "")
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse?.statusCode ?? 0)
                    
                    
                    let responseData = String(data: data!, encoding: String.Encoding.utf8)
                    
                    print("responseData: \(responseData ?? "Blank Data")")
                    
                    if(httpResponse?.statusCode == 200) {
                        DispatchQueue.main.async {
                            print("SDSDSD")
                            
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            self.showToast(message: "Wrong Credentials")
                            
                        }
                        
                    }
                }
            })
            
            dataTask.resume()
            
        }
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

extension RegistrationViewController: CheckBoxCellDelegate {
    func checkBoxSelection(isChecked: Bool) {
        self.isChecked = isChecked
        if isChecked {
            createPickerView()
        }
        tableView.reloadData()
    }
}
