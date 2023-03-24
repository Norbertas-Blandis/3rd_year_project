//
//  LessonManager.swift
//  firstTest
//
//  Created by Norbertas Blandis on 07/11/2022.
//

import Foundation
import SwiftUI

class LessonManager: ObservableObject {
    
    static func createLessonModel() -> Lessons {
        return Lessons(lessonModel: lessonList)
    }
    
    @Published var model = LessonManager.createLessonModel()
}

extension LessonManager{
    
    static var lessonList: [LessonModel]{
        
        [LessonModel(id: 0,
                     title: "Prerequesites",
                     duration: "10 min",
                     isUnlocked: true,
                     isCompleted: false,
                     goToLesson: false),
         
        LessonModel(id: 1,
                    title: "Sequences and convergence",
                    duration: "20 min",
                    isUnlocked: true,
                    isCompleted: false,
                    goToLesson: false),
         
        LessonModel(id: 2,
                    title: "Using convergence",
                    duration: "15 min",
                    isUnlocked: true,
                    isCompleted: false,
                    goToLesson: false),
         
         LessonModel(id: 3,
                     title: "Theorems on convergence",
                     duration: "15 min",
                     isUnlocked: true,
                     isCompleted: false,
                     goToLesson: false),
        
         LessonModel(id: 4,
                     title: "Continuity",
                     duration: "10 min",
                     isUnlocked: true,
                     isCompleted: false,
                     goToLesson: false),
        
         LessonModel(id: 5,
                     title: "Theorems on continuity",
                     duration: "20 min",
                     isUnlocked: false,
                     isCompleted: false,
                     goToLesson: false)]
    }
}
