//
//  QuestionAndAnswer.swift
//  AgrarForum
//
//  Created by Rashad Nagiev on 5/4/20.
//  Copyright © 2020 Rashad Nagiev. All rights reserved.
//

import Foundation

struct QuestionAndAnswer: Codable {
    let answer: [Answer]
    let question: [Question]
}
