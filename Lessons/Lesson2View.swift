//
//  Lesson2View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 05/11/2022.
//

import SwiftUI

struct Lesson2View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        Text("Welcome to lesson #2")
    }
}

struct Lesson2View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2View(lessonId: 2, lessonManager: LessonManager())
    }
}
