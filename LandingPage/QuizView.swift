//
//  QuizView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 25/10/2022.
//

import SwiftUI

struct QuizView: View {
    
    @State private var goToQuiz0 = false
    @State private var goToQuiz1 = false
    @State private var goToQuiz2 = false
    @State private var goToQuiz3 = false
    @State private var goToQuiz4 = false
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                
            VStack{
                
                //Prerequisite excercises
                let prerequisitesLesson = LessonManager().model.lessonModel[0]
                NavigationLink(
                    destination: PrerequisitesQuizList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Prerequisite excercises")),
                    isActive: $goToQuiz0){
                        Button(action: prerequisitesLesson.isUnlocked ? { goToQuiz0.toggle() } : {}) {
                            HStack {
                                Text(String(prerequisitesLesson.id + 1) + ". " + prerequisitesLesson.title).padding()
                                Spacer()
                                Text(Image(systemName: prerequisitesLesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Convergence excercises
                let convergenceLesson = LessonManager().model.lessonModel[1]
                NavigationLink(
                    destination: ConvergenceQuizList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence excercises")),
                    isActive: $goToQuiz1){
                        Button(action: convergenceLesson.isUnlocked ? { goToQuiz1.toggle() } : {}) {
                            HStack {
                                Text(String(convergenceLesson.id + 1) + ". " + convergenceLesson.title).padding()
                                Spacer()
                                Text(Image(systemName: convergenceLesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Continuity excercises
                let continuityLesson = LessonManager().model.lessonModel[4]
                NavigationLink(
                    destination: ContinuityQuizList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Continuity excercises")),
                    isActive: $goToQuiz2){
                        Button(action: continuityLesson.isUnlocked ? { goToQuiz2.toggle() } : {}) {
                            HStack {
                                Text(String(continuityLesson.id + 1) + ". " + continuityLesson.title).padding()
                                Spacer()
                                Text(Image(systemName: continuityLesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }

                
            }.padding(.all, 10)
            }.navigationTitle("Excercises")
        }.accentColor(Color(.label))
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
