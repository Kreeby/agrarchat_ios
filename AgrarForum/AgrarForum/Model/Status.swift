//
//  Status.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/9/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation

struct Status: Codable {
    var status: String?
    var message: [TitleAndDate]?
}
