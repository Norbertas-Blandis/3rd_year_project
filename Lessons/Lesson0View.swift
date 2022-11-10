//
//  Lesson0View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 27/10/2022.
//

import SwiftUI

struct Lesson0View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack{
                    
                    Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
                }
            }
        }
    }
}

struct Lesson0View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson0View(lessonId: 0, lessonManager: LessonManager())
    }
}
