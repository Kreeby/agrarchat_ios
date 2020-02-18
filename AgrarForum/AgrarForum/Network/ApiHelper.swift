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
}
