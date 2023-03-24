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
    let userEmail = Auth.auth().currentUser?.email
    
    @State private var goToLesson0 = false
    @State private var goToLesson1 = false
    @State private var goToLesson2 = false
    @State private var goToLesson3 = false
    @State private var goToLesson4 = false
    
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
                                            Text(String(lesson.id + 1) + ". " + lesson.title).padding(.leading)
                                            Spacer()
                                            Text(lesson.duration).padding()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                                        }.modifier(NotPulsatingButtonStyleFullFrame())
                                    }.padding(.all, 5)

                            }
                        } else if String(lesson.id) == "1"{
                            NavigationLink(
                                destination: Lesson1View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson1){
                                    Button(action: lesson.isUnlocked ? { goToLesson1.toggle() } : {}) {
                                        HStack {
                                            Text(String(lesson.id + 1) + ". " + lesson.title).padding(.leading)
                                            Spacer()
                                            Text(lesson.duration).padding()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                                        }.modifier(NotPulsatingButtonStyleFullFrame())
                                    }.padding(.all, 5)
                            }
                        } else if String(lesson.id) == "2"{
                            NavigationLink(
                                destination: Lesson2View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson2){
                                    Button(action: lesson.isUnlocked ? { goToLesson2.toggle() } : {}) {
                                        HStack {
                                            Text(String(lesson.id + 1) + ". " + lesson.title).padding(.leading)
                                            Spacer()
                                            Text(lesson.duration).padding()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                                        }.modifier(NotPulsatingButtonStyleFullFrame())
                                    }.padding(.all, 5)
                            }
                        }else if String(lesson.id) == "3"{
                            NavigationLink(
                                destination: Lesson3View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson3){
                                    Button(action: lesson.isUnlocked ? { goToLesson3.toggle() } : {}) {
                                        HStack {
                                            Text(String(lesson.id + 1) + ". " + lesson.title).padding(.leading)
                                            Spacer()
                                            Text(lesson.duration).padding()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                                        }.modifier(NotPulsatingButtonStyleFullFrame())
                                    }.padding(.all, 5)
                            }
                        } else if String(lesson.id) == "4"{
                            NavigationLink(
                                destination: Lesson4View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson4){
                                    Button(action: lesson.isUnlocked ? { goToLesson4.toggle() } : {}) {
                                        HStack {
                                            Text(String(lesson.id + 1) + ". " + lesson.title).padding(.leading)
                                            Spacer()
                                            Text(lesson.duration).padding()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                                        }.modifier(NotPulsatingButtonStyleFullFrame())
                                    }.padding(.all, 5)
                            }
                        }else{
                            NavigationLink(
                                destination: Lesson2View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(false).navigationBarTitle(Text("")),
                                isActive: $goToLesson2){
                                    Button(action: lesson.isUnlocked ? { goToLesson2.toggle() } : {}) {
                                        HStack {
                                            Text(String(lesson.id + 1) + ". " + lesson.title).padding(.leading)
                                            Spacer()
                                            Text(lesson.duration).padding()
                                            Text(Image(systemName: lesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                                        }.modifier(NotPulsatingButtonStyleFullFrame())
                                    }.padding(.all, 5)
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
