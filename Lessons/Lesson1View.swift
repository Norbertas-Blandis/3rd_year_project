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
        VStack{
            Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
                .modifier(BlackTitleTextStyle())
            
            NavigationLink(destination: SequenceDefinitionView().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Start the lesson!").modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90)
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
                LineWithExpandingPoints(numOfPoints: 4, namesOfPoints: ["1", "2", "3", "4"])
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
            VStack{
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
            }.modifier(GrayContainerStyle(opacity: 0.25))
            Spacer()
            
            StringAnswerCheckerView(question: "", correctAnswer: "64", destinationView: AnyView(AnswerChecker2View()), destinationViewTitle: "Practise #2", explanationView: AnyView(SequenceIntroExp1()))
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
            VStack{
                HStack{
                    Text("For a sequence ")
                    TextView(string: $question1).frame(width: 100.0, height: 30.0)
                }
                
                HStack{
                    Text("Given by: ")
                    TextView(string: $question2).frame(width: 120.0, height: 30.0)
                }
                
                HStack{
                    Text("What is the value of x, if")
                    TextView(string: $question3).frame(width: 120.0, height: 30.0)
                }
            }.modifier(BlackTitleAcademicTextStyle()).modifier(GrayContainerStyle(opacity: 0.25))
            Spacer()
            
            StringAnswerCheckerView(question: "", correctAnswer: "5", destinationView: AnyView(SubsequenceDefinitionView()), destinationViewTitle: "Subsequences", explanationView: AnyView(SequenceIntroExp2()))
            
        }
    }
}

//import LaTeXSwiftUI

struct SubsequenceDefinitionView: View{
    
    @State private var seqdefinition : String = "[math](a_{n})_{n∈N}[/math],"
    @State private var subdefinition: String = "[math](a_{n_{k}})_{k∈N}[/math]"
    @State private var subindequality: String = "[math]n_{1}<n_{2}<n_{3}<...[/math]"
    
    var body: some View{
        VStack{
            VStack{
                Spacer()
                HStack{
                    Text("Given a sequence")
                    TextView(string: $subdefinition).frame(width: 100.0, height: 40.0)
                }
                Text("A subsequence is any sequence of the form")
                TextView(string: $subdefinition).frame(width: 100.0, height: 40.0)
                HStack{
                    Text("Where")
                    TextView(string: $subindequality).frame(width: 200.0, height: 23.0)
                }
                Spacer()
            }.modifier(BlackTitleAcademicTextStyle())
            
            NavigationLink(destination: SubsequenceIntuitionView().navigationBarTitle("Subsequences").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90).padding(10)
    }
}

struct SubsequenceIntuitionView: View{
    
    @State private var seqdefinition : String = "[math](a_{n})_{n∈N}[/math],"
    @State private var subdefinition: String = "[math](a_{n_{k}})_{k∈N}[/math]"
    @State private var subindequality: String = "[math]n_{1}<n_{2}<n_{3}<...[/math]"
    
    @State private var showSubsequence = false
    @State private var randomList = ["", "", "", "", "", ""]
    
    var body: some View{
        VStack{
            VStack{
                Spacer()
                Text("More simply, you can think of it as 'what is left' of a sequence after deleting some elements:").modifier(BlackTitleAcademicTextStyle())
                
                HStack{
                    LineWithExpandingPoints(numOfPoints: 6, namesOfPoints: ["a","b","c","d","e","f"]).offset(x:-50)
                    Text("...").offset(x:120, y:-8)
                }
                
                Button(action: {
                    self.showSubsequence = true
                    self.randomList = (0..<6).map { index in
                                        Bool.random() ? String(Character(UnicodeScalar(65+index)!)) : ""
                                    }.map { $0.lowercased() }
                }) {
                    (Text("Generate new subsequence  ")+Text(Image(systemName: "arrow.down"))).modifier(GrayButtonWhiteTextStyle())
                }
                
                HStack{
                    if !self.showSubsequence{
                        LineWithExpandingPoints(numOfPoints: 6, namesOfPoints: self.randomList).offset(x:-50)
                    } else{
                        LineWithExpandingPoints(numOfPoints: 6, namesOfPoints: self.randomList).offset(x:-50)
                        Text("...").offset(x:120, y:-8)
                    }
                }
                Spacer()
                
            }
            
            NavigationLink(destination: ConvergenceIntuitionView().navigationBarTitle("Convergence").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90).padding(10)
    }
}

struct ConvergenceIntuitionView: View{
    
    @State private var seqdefinition : String = "[math](a_{n})_{n∈N}[/math],"
    @State private var subdefinition: String = "[math](a_{n_{k}})_{k∈N}[/math]"
    @State private var subindequality: String = "[math]n_{1}<n_{2}<n_{3}<...[/math]"
    
    @State private var sliderValue: Double = 0.0
    
    var body: some View{
        VStack{
            VStack{
                Spacer()
                Text("It is often useful to find out whether a given sequence converges.\nIntuitively, we can understand convergence as 'approaching a point'")
                
                LineWithSlider(pointsCount: 10, labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]).padding()
                Spacer()
            }.modifier(BlackTitleAcademicTextStyle())
            
//            NavigationLink(destination: SubsequenceIntuitionView().navigationBarTitle("Subsequences").navigationBarHidden(false),label: {
//                Text("Next!")
//                    .modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).padding(10)
    }
}

//struct AnswerChecker3View: View{
//
//    @State private var question1 : String = "[math](a_{n})_{n∈N}[/math]"
//    @State private var question2 : String = "[math]a_{n}=n^3[/math]"
//    @State private var question3 : String = "[math]a_{4}[/math]"
//
//    var body: some View{
//        VStack{
//
//            Spacer()
//            VStack{
//                HStack{
//                    Text("For a sequence ")
//                    TextView(string: $question1).frame(width: 100.0, height: 30.0)
//                }.modifier(BlackTitleAcademicTextStyle())
//
//                HStack{
//                    Text("Given by: ")
//                    TextView(string: $question2).frame(width: 100.0, height: 30.0)
//                }.modifier(BlackTitleAcademicTextStyle())
//
//                HStack{
//                    Text("What is the value of: ")
//                    TextView(string: $question3).frame(width: 100.0, height: 30.0)
//                }.modifier(BlackTitleAcademicTextStyle())
//            }.modifier(GrayContainerStyle(opacity: 0.25))
//            Spacer()
//
//            StringAnswerCheckerView(question: "", correctAnswer: "64", destinationView: AnyView(AnswerChecker2View()), destinationViewTitle: "Practise #2", explanationView: AnyView(SequenceIntroExp1()))
//        }
//    }
//}

struct Lesson1View_Previews: PreviewProvider {
    static var previews: some View {
        ConvergenceIntuitionView()
        
    }
}
