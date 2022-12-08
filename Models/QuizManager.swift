//
//  QuizManager.swift
//  firstTest
//
//  Created by Norbertas Blandis on 26/10/2022.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    
    static var currentIndex = 0
    
    static func createQuizModel(i:Int) -> Quiz {
        return Quiz(currecntQuestionIndex: i, quizModel: quizDataSets[i], quizCompleted: false)
    }
    
    @Published var model = QuizManager.createQuizModel(i: QuizManager.currentIndex)
    
    func verifyAnswer(selectedOption: QuizOption) {

        for index in model.quizModel.optionList.indices{
            model.quizModel.optionList[index].isMatched = false
            model.quizModel.optionList[index].isSelected = false
        }
        
        if let index = model.quizModel.optionList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId == model.quizModel.answer {
                model.quizModel.optionList[index].isMatched = true
                model.quizModel.optionList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                    if (QuizManager.currentIndex < QuizManager.quizDataSets.count - 1){
                        QuizManager.currentIndex = QuizManager.currentIndex + 1
                        self.model = QuizManager.createQuizModel(i: QuizManager.currentIndex)
                    } else{
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                    }
                }
            } else {
                model.quizModel.optionList[index].isMatched = false
                model.quizModel.optionList[index].isSelected = true
            }
        }
    }
}

extension QuizManager{
    static var quizDataSets: [QuizModel]{
        [
            QuizModel(question: "1. Which of the following is a set? (In our notation)",
                      answer: "C",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "1, 2, 3", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "(1, 2, 3)", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "{1, 2, 3}", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "[1, 2, 3]", color: Color.black)]),
            
            QuizModel(question: "2. Which of the statements about a set X = {1, 2, 3} is correct?",
                      answer: "B",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "a ∈ X", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "1 ∈ X", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "1 ⊂ X", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "{1} ∈ X", color: Color.black)]),
            
            QuizModel(question: "3. Which of the statements about a set X = {1, 2, 3} is incorrect?",
                      answer: "C",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "2 ∈ X", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "{2} ⊂ X", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "2 ⊂ X", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "{1, 2} ⊂ X", color: Color.black)])
        
        ]
    }
    
    
    static var quizDataQuantifiers: [QuizModel]{
        [
            QuizModel(question: "1. Which of the following is a set? (In our notation)",
                      answer: "C",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "1, 2, 3", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "(1, 2, 3)", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "{1, 2, 3}", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "[1, 2, 3]", color: Color.black)]),
            
            QuizModel(question: "2. Which of the quantifiers mean 'there exists'",
                      answer: "B",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "∀", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "∃", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "∈", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "=", color: Color.black)]),
            
            QuizModel(question: "3. Given function f:X->Y, what is the codomain of f?",
                      answer: "C",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "f", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "X", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "Y", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "x∈X", color: Color.black)]),
            
            QuizModel(question: "4. Is this the fourth question?",
                      answer: "A",
                      optionList: [QuizOption(id: 1, optionId: "A", option: "yes", color: Color.black),
                                   QuizOption(id: 2, optionId: "B", option: "no", color: Color.black),
                                   QuizOption(id: 3, optionId: "C", option: "maybe", color: Color.black),
                                   QuizOption(id: 4, optionId: "D", option: "-", color: Color.black)])
        
        ]
    }
}
