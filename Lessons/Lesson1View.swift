//
//  Lesson1View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 05/11/2022.
//

import SwiftUI

struct Lesson1View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
                    .modifier(BlackTitleTextStyle())
                
                NavigationLink(destination: SequenceDefinitionView().navigationBarTitle("").navigationBarHidden(false),label: {
                    Text("Start the lesson!")
                        .modifier(GreenButtonWhiteTextStyle())})
            }.offset(y: -90)
        }.accentColor(Color(.label))
    }
}

struct SequenceDefinitionView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("A sequence is a list of real numbers: indexed by natural numbers:")
                .modifier(BlackTitleAcademicTextStyle())
            (Text("a")+Text("1").baselineOffset(-10).font(.system(size: 15))+Text(", a")+Text("2").baselineOffset(-10).font(.system(size: 15))+Text(", a")+Text("3").baselineOffset(-10).font(.system(size: 15))+Text(", a")+Text("4").baselineOffset(-10).font(.system(size: 15))).modifier(BlackTitleAcademicTextStyle())
            
            Text("A sequence is usually denoted by: \n (an)ninN\nWhere n is called the index and an is the value of the nth element")
                .modifier(BlackTitleAcademicTextStyle())
            Spacer()
            NavigationLink(destination: AnswerChecker1View().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90)
    }
}

struct AnswerChecker1View: View{
    var body: some View{
        VStack{
            Spacer()
            LineWithExpandingPoints()
            Spacer()
            StringAnswerCheckerView(question: "Koks tavo mėgstamoiausias narkotikas?", correctAnswer: "Zaza")
            Spacer()
        }
    }
}

struct Lesson1View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1View(lessonId: 1, lessonManager: LessonManager())
        
    }
}
