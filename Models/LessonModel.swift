//
//  LessonModel.swift
//  firstTest
//
//  Created by Norbertas Blandis on 07/11/2022.
//

import Foundation
import SwiftUI

struct Lessons{
    
    var lessonModel: [LessonModel]
}

struct LessonModel: Identifiable{
    
    var id: Int
    var title: String
    var duration: String
    var isUnlocked: Bool = false
    var isCompleted: Bool = false
    @State var goToLesson: Bool = false
//    var destinationView: AnyView
}
