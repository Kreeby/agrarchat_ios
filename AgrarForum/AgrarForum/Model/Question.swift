//
//  Question.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 2/26/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation

struct Question: Codable {
    let text, token: String?
    let addedBy, addedTo: Int?
    let category, image, updatedAt, createdAt: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case text, token
        case addedBy = "added_by"
        case addedTo = "added_to"
        case category, image
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}
