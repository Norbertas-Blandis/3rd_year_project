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
    @State var isUnlocked: Bool
    @State var isCompleted: Bool
    @State var goToLesson: Bool
//    var destinationView: AnyView
}
