//
//  ApiHelper.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/9/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ApiHelper {
    static let shared = ApiHelper()
    var email: String?
    var password: String?
    static var id: JSON!
    
    func getQuestionList(id: Int, success: @escaping([TitleAndDate])->(), failure: @escaping(String)->()) {
        let params = ["added_to": id]
        
        AF.request("http://localhost:8000/listByWhom",
                   method: .post,
                   parameters: params).responseData { response in
                    guard let data = response.data else { return }
                    
                    do {
                        print(response)
                        let question = try JSONDecoder().decode(Status.self, from: data)
                        
                        success(question.message ?? [])
                    } catch let err {
                        print(err.localizedDescription)
                        failure(err.localizedDescription)
                    }
        }
    }
    
    
    func login(email: String, password: String, success: (@escaping(User)->()) , failure: @escaping(String)->()) {
        let params:Parameters = ["email": email, "password": password]
        AF.request("http://localhost:8000/login",
                   method: .post,
                   parameters: params).responseData { response in
                    
                    guard let data = response.data else { return }
                    
                    do {
                        print(response)
                        let user = try JSONDecoder().decode(StatusUser.self, from: data)
                        UserDefaults.standard.set(user.user?.api_token, forKey: "api_token")
                        success(user.user!)
                    } catch let err {
                        print(err.localizedDescription)
                        failure(err.localizedDescription)
                    }
        }
        
        
    }
    
    
    func searchUsers(success: (@escaping([User]) -> ()), failure: @escaping(String)->()) {
        AF.request("http://localhost:8000/listUsers",
                   method: .post).responseData { response in
                    
                    guard let data = response.data else {return}
                    
                    do {
                        print(response)
                        let user = try JSONDecoder().decode(StatusUser.self, from: data)
                        
                        success(user.message ?? [])
                    }
                    catch let err{
                        print(err.localizedDescription)
                        failure(err.localizedDescription)
                    }
        }
    }
    
    
    func addQuestion(image: UIImage, imageName: String, category: String, added_to: Int, text: String,
                     success: (@escaping()->()) , failure: @escaping(String)->()) {
        
        let imageData = image.jpegData(compressionQuality: 0.2)
        AF.upload(multipartFormData: { multipartFormData in
            let params: Parameters = ["api_token": UserDefaults.standard.string(forKey: "api_token") ?? "", "category": category, "added_to": added_to, "text": text]
            print(params)
            for (key, value) in params {
                multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
            }
            
            if let data = imageData {
                multipartFormData.append(data, withName: "image", fileName: imageName, mimeType: "image/jpeg")
            }
            
        }, to: "http://localhost:8000/addQuestion", method: .post).responseData { response in
            guard let data = response.data else { return }
            
            do {
                let status = try JSONDecoder().decode(StatusQuestion.self, from: data)
                
                print(status.question)
                if status.status == 200 {
                    
                    success()
                }
            } catch let err {
                print("error: \(err)")
                failure(err.localizedDescription)
            }
        }
        
    }
    
    func isAnswer(id: Int, success: @escaping(QuestionAndAnswer)->() , failure: @escaping(String)->()) {
        let params:Parameters = ["id": id, "api_token": UserDefaults.standard.string(forKey: "api_token") ?? ""]
        AF.request("http://localhost:8000/isAnswer",
                   method: .post,
                   parameters: params).responseJSON { response in
                    print(params)
                    
                    guard let data = response.data else {return}
                    
                    do {
                        
                        
                        
                        let message = try JSONDecoder().decode(StatusQuestionAndAnswer.self, from: data)
                        print(message.message.question[0].text)
                        success(message.message)
                        
                    }
                    catch let err{
                        print(err.localizedDescription)
                        failure(err.localizedDescription)
                    }
        }
    }
    
    
    func getImageByURL(_ url: String, completed: @escaping(Result <UIImage, String>)->()) {
        AF.request(url).responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                completed(.success(image))
            }
            else {
                completed(.failure("ERROR"))
            }
        }
    }
    
    
}


extension String:Error{}
