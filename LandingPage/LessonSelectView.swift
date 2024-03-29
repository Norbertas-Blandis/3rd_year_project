//
//  LessonSelectView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 07/11/2022.
//

import SwiftUI
import Firebase

struct LessonSelectView: View {
    
    @ObservedObject var lessonManager: LessonManager
    @State var isCompleted: Bool
    var completedLessonId: Int
    var unlockedLessonId: Int
    
    @State private var goToLesson0 = false
    @State private var goToLesson1 = false
    @State private var goToLesson2 = false
    @State private var goToLesson3 = false
    @State private var goToLesson4 = false
    
    func updateLessonModel(num1: Int, num2: Int) {
        
        let lesson1: LessonModel = lessonManager.model.lessonModel[num1]
        let lesson2: LessonModel = lessonManager.model.lessonModel[num2]
        
        let currTempLesson = LessonModel(id: lesson1.id,
                                         title: lesson1.title,
                                         duration: lesson1.duration,
                                         isUnlocked: lesson1.isUnlocked,
                                         isCompleted: true,
                                         goToLesson: lesson1.goToLesson)
        let nextTempLesson = LessonModel(id: lesson2.id,
                                         title: lesson2.title,
                                         duration: lesson2.duration,
                                         isUnlocked: true,
                                         isCompleted: lesson2.isCompleted,
                                         goToLesson: lesson2.goToLesson)
        lessonManager.model.lessonModel[num1] = currTempLesson
        lessonManager.model.lessonModel[num2] = nextTempLesson
    }
    
    var body: some View {
        
        
        NavigationView{
            ScrollView{

                //Lesson completed congratulations view
                if isCompleted{
                    ZStack {
                        Color.white
                        VStack {
                            Text("Congratulations on completing the "+lessonManager.model.lessonModel[completedLessonId].title+" lesson!")
                                .font(.system(size: 20)).fontWeight(.bold).multilineTextAlignment(.center)
                            Text("You have unlocked the "+lessonManager.model.lessonModel[unlockedLessonId].title+" lesson!")
                                .font(.system(size: 18)).multilineTextAlignment(.center).padding(5)

                            Button(action: {
                                updateLessonModel(num1: 0, num2: 1)
                                isCompleted = false
                            }) {
                                Text("Great!")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 20)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(color: Color.blue.opacity(0.7), radius: 5, x: 0, y: 5)
                            }
                        }
                    }.frame(width: .infinity, height: 200).cornerRadius(20).shadow(radius: 10).padding(15)
                }

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
            }.navigationBarTitle("Lessons")
        }.accentColor(Color(.label))
    }
}

struct LessonSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LessonSelectView(lessonManager: LessonManager(), isCompleted: false, completedLessonId: -1, unlockedLessonId: -1)
    }
}
