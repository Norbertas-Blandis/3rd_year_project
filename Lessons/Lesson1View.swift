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
            HStack{
                SubscriptString(main: "a",sub: "1")
                SubscriptString(main: ", a",sub: "2")
                SubscriptString(main: ", a",sub: "3")
                SubscriptString(main: ", a",sub: "4")
            }.modifier(BlackTitleAcademicTextStyle())
            
            Text("A sequence is usually denoted by:")
                .modifier(BlackTitleAcademicTextStyle())
            
            MainSequenceDefinitionView().modifier(BlackTitleAcademicTextStyle())

            (Text("Where n is called the index and ")+Text("a")+Text("n").baselineOffset(-10).font(.system(size: 15))+Text(" is the value of the nth element"))
                .modifier(BlackTitleAcademicTextStyle())
            Spacer()
            
            NavigationLink(destination: SequenceExampleView().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90).padding(10)
    }
}

struct SequenceExampleView: View {
    var body: some View {
        VStack{
            
            Spacer()
            Text("A simple example of a sequence is the natural numbers N:")
                .modifier(BlackTitleAcademicTextStyle())
            
            HStack{
                LineWithExpandingPoints(numOfPoints: 4)
                Text(" ... ").modifier(BlackTitleAcademicTextStyle()).offset(x: (CGFloat(4) * 50-125), y: -3)
            }
            
            Text("Here we have:")
                .modifier(BlackTitleAcademicTextStyle())
            
            HStack{
                SubscriptString(main: "a",sub: "1")
                Text("= 1, ")
                SubscriptString(main: "a",sub: "2")
                Text("= 2, ")
                SubscriptString(main: "a",sub: "3")
                Text("= 3, ...")
            }.modifier(BlackTitleAcademicTextStyle())
            
            Spacer()
            
            NavigationLink(destination: AnswerChecker1View().navigationBarTitle("Practice #1").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).padding(10)
    }
}

import CodeViewer

struct AnswerChecker1View: View{
    
    @State private var question1 : String = "[math](a_{n})_{n∈N}[/math]"
    @State private var question2 : String = "[math]a_{n}=n^3[/math]"
    @State private var question3 : String = "[math]a_{4}[/math]"
    
    var body: some View{
        VStack{
            
            Spacer()
            
            HStack{
                Text("For a sequence ")
                TextView(string: $question1).frame(width: 100.0, height: 30.0)
            }.modifier(BlackTitleAcademicTextStyle())
            
            HStack{
                Text("Given by: ")
                TextView(string: $question2).frame(width: 100.0, height: 30.0)
            }.modifier(BlackTitleAcademicTextStyle())
            
            HStack{
                Text("What is the value of: ")
                TextView(string: $question3).frame(width: 100.0, height: 30.0)
            }.modifier(BlackTitleAcademicTextStyle())
            
            Spacer()
            
            StringAnswerCheckerView(question: "", correctAnswer: "81", destinationView: AnyView(AnswerChecker2View()), destinationViewTitle: "Practise #2", explanationView: AnyView(SequenceIntroExp1()))
        }
    }
}

struct AnswerChecker2View: View{
    
    @State private var question1 : String = "[math](a_{n})_{n∈N}[/math]"
    @State private var question2 : String = "[math]a_{n}=1/(n^2)[/math]"
    @State private var question3 : String = "[math]a_{x}=1/25[/math]"
    
    var body: some View{
        VStack{
            
            Spacer()
            
            HStack{
                Text("For a sequence ")
                TextView(string: $question1).frame(width: 100.0, height: 30.0)
            }.modifier(BlackTitleAcademicTextStyle())
            
            HStack{
                Text("Given by: ")
                TextView(string: $question2).frame(width: 120.0, height: 30.0)
            }.modifier(BlackTitleAcademicTextStyle())
            
            HStack{
                Text("What is the value of x, if")
                TextView(string: $question3).frame(width: 120.0, height: 30.0)
            }.modifier(BlackTitleAcademicTextStyle())
            
            Spacer()
            
            StringAnswerCheckerView(question: "", correctAnswer: "5", destinationView: AnyView(SubsequenceDefinitionView()), destinationViewTitle: "", explanationView: AnyView(SequenceIntroExp2()))
            
        }
    }
}

struct SubsequenceDefinitionView: View{
    
    @State private var question1 : String = "[math](a_{n})_{n∈N}[/math]"
    @State private var question2 : String = "[math]a_{n}=n^3[/math]"
    @State private var question3 : String = "[math]a_{4}[/math]"
    
    var body: some View{
        VStack{
            
            Text("Subsequences").modifier(BlackTitleAcademicTextStyle())
            
            Spacer()
        }
    }
}

struct Lesson1View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1View(lessonId: 1, lessonManager: LessonManager())
        
    }
}
