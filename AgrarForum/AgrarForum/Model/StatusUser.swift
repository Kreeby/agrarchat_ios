//
//  StatusUser.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/14/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation

struct StatusUser: Codable {
    var status: String?
    var user: User?
    var message: [User]?
}
