//
//  LessonSelectView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 07/11/2022.
//

import SwiftUI

struct LessonSelectView: View {
    
    @ObservedObject var lessonManager: LessonManager
    
    @State private var goToLesson0 = false
    @State private var goToLesson1 = false
    @State private var goToLesson2 = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach(lessonManager.model.lessonModel){ lesson in
                        
                        if String(lesson.id) == "0"{
                            NavigationLink(
                                destination: Lesson0View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson0){
                                    Button(action: lesson.isUnlocked ? { goToLesson0.toggle() } : {}) {
                                        HStack {
                                            Spacer()
                                            Text(String(lesson.id + 1) + ". " + lesson.title)
                                            Spacer()
                                            Text(lesson.duration)
                                            Spacer()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock"))
                                            Spacer()
                                        }.modifier(LessonSelectButtonStyle())
                                    }.padding(.all, 10)

                            }
                        } else{
                            NavigationLink(
                                destination: Lesson1View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson1){
                                    Button(action: lesson.isUnlocked ? { goToLesson1.toggle() } : {}) {
                                        HStack {
                                            Spacer()
                                            Text(String(lesson.id + 1) + ". " + lesson.title)
                                            Spacer()
                                            Text(lesson.duration)
                                            Spacer()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock"))
                                            Spacer()
                                        }.modifier(LessonSelectButtonStyle())
                                    }.padding(.all, 10)
                            }

                        }
                    }
                }.padding(.all, 10)
            }.navigationBarTitle("Lessons")
        }.accentColor(Color(.label))
    }
}

struct LessonSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LessonSelectView(lessonManager: LessonManager())
    }
}
