//
//  User.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/14/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation

struct User:Codable {
    let id: Int?
    let username: String?
    let email: String?
    let api_token: String?
    let granted: String?
    let category: String?
    let created_at: String?
    let updated_at: String?
}
