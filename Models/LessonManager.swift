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
//                     destinationView: AnyView(Lesson0View(lessonId: 0, lessonManager: LessonManager()))),
         
        LessonModel(id: 1,
                    title: "Sequence introduction",
                    duration: "20 min",
                    isUnlocked: false,
                    isCompleted: false,
                    goToLesson: false),
//                    destinationView: AnyView(Lesson1View(lessonId: 1, lessonManager: LessonManager()))),
         
        LessonModel(id: 2,
                    title: "Sequence examples",
                    duration: "10 min",
                    isUnlocked: false,
                    isCompleted: false,
                    goToLesson: false)]
//                    destinationView: AnyView(Lesson2View(lessonId: 2, lessonManager: LessonManager())))]
    }
}
