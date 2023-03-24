//
//  QuizView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 25/10/2022.
//

import SwiftUI

struct QuizView: View {
    
    @State private var isQuiz1Unlocked = true
    @State private var isQuiz2Unlocked = false
    @State private var isQuiz3Unlocked = false
    
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
                    destination: PrerequisitesQuizList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Prerequisite excersices")),
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
                    destination: ConvergenceQuizList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence excersices")),
                    isActive: $goToQuiz0){
                        Button(action: convergenceLesson.isUnlocked ? { goToQuiz0.toggle() } : {}) {
                            HStack {
                                Text(String(convergenceLesson.id + 1) + ". " + convergenceLesson.title).padding()
                                Spacer()
                                Text(Image(systemName: convergenceLesson.isUnlocked ? "lock.open" : "lock")).padding(.trailing)
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
