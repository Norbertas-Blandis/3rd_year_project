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
                        NavigationLink(
                            destination: Lesson0View(lessonId: lesson.id, lessonManager: LessonManager()).navigationBarBackButtonHidden(true).navigationBarTitle(Text(""), displayMode: .inline),
                            isActive: $goToLesson0){
                                Button(action: lesson.isUnlocked ? {goToLesson0.toggle()} : {}) {
                                    HStack{
                                        Text(String(lesson.id+1)+". "+lesson.title)
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 18, weight: .bold))
                                            .multilineTextAlignment(.center)
                                            .padding()
                                        Spacer()
                                        Text(lesson.duration).padding()
                                        Spacer()
                                        Image(systemName: lesson.isUnlocked ? "lock.open" : "lock").padding()
                                    }.padding(8.0)
                                    .border(Color.black, width: 2)
                                    .cornerRadius(10)
                                }
                        }.isDetailLink(true)
                    }
                }.padding(.all, 10).offset(y: -10)
                
            }
            .navigationBarTitle("Lessons")
            .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
        }
    }
}

struct LessonSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LessonSelectView(lessonManager: LessonManager())
    }
}
