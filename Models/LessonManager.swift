//
//  LessonManager.swift
//  firstTest
//
//  Created by Norbertas Blandis on 07/11/2022.
//

import Foundation
import SwiftUI

class LessonManager: ObservableObject {
    
    static var lessonList: [LessonModel]{
        
        [LessonModel(title: "Prerequesites",
                     duration: "10 min",
                     isUnlocked: true,
                     isCompleted: false),
         
        LessonModel(title: "Sequence introduction",
                     duration: "20 min",
                     isUnlocked: false,
                     isCompleted: false),
         
        LessonModel(title: "Sequence examples",
                     duration: "10 min",
                     isUnlocked: false,
                     isCompleted: false)]
    }
}
