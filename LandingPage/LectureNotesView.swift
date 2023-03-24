//
//  ProfileView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI

struct LectureNotesView: View {
    
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
                    destination: PrerequisitesNotesList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Prerequisites")),
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
                    destination: ConvergenceNotesList().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence")),
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
                    destination: ContinuityNotesView().navigationBarBackButtonHidden(false).navigationBarTitle(Text("Continuity")),
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
            }.navigationTitle("Lecture Notes")
        }.accentColor(Color(.label))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LectureNotesView()
    }
}
