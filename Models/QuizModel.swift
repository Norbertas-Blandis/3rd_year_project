//
//  QuizModel.swift
//  firstTest
//
//  Created by Norbertas Blandis on 26/10/2022.
//

import Foundation
import SwiftUI

struct Quiz{
    var currecntQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool
    var quizWinningStatus: Bool = false
}

struct QuizModel {
    var question: String
    var answer: String
    var optionList: [QuizOption]
}

struct QuizOption: Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
}
