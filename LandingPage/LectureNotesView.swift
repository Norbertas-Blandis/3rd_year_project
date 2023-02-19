//
//  ProfileView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestoreSwift

struct LectureNotesView: View {
    
    @ObservedObject var lessonManager: LessonManager
    
    let userId = Auth.auth().currentUser?.uid
    
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
                                            Text(String(lesson.id + 1) + ". " + lesson.title + " notes")
                                            Spacer()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock"))
                                            Spacer()
                                        }.modifier(LessonSelectButtonStyle())
                                    }.padding(.all, 10)

                            }
                        } else{
                            NavigationLink(
                                destination: Lesson1View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson0){
                                    Button(action: lesson.isUnlocked ? { goToLesson0.toggle() } : {}) {
                                        HStack {
                                            Spacer()
                                            Text(String(lesson.id + 1) + ". " + lesson.title + " notes")
                                            Spacer()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock"))
                                            Spacer()
                                        }.modifier(LessonSelectButtonStyle())
                                    }.padding(.all, 10)
                            }

                        }
                    }
                }.padding(.all, 10)
            }.navigationTitle("Lecture Notes")
        }.accentColor(Color(.label))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LectureNotesView(lessonManager: LessonManager())
    }
}
