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
            }.modifier(GrayContainerStyle(opacity: 0.25)).padding(15)
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
            }.modifier(BlackTitleAcademicTextStyle()).modifier(GrayContainerStyle(opacity: 0.25)).padding(15)
            Spacer()
            
            StringAnswerCheckerView(question: "", correctAnswer: "5", destinationView: AnyView(SubsequenceDefinitionView()), destinationViewTitle: "Subsequences", explanationView: AnyView(SequenceIntroExp2()))
            
        }
    }
}

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
    
    @State private var sliderValue: Double = 0.0
    
    var body: some View{
        VStack{
            VStack{
                Spacer()
                Text("Intuitively, we can understand convergence as 'approaching a point'").modifier(BlackTitleAcademicTextStyle())
                
                Text("Here is a convergent sequence, can you guess which number does it converge to?").modifier(BlackDetailedAcademicTextStyle())
                
                let maxWidth = UIScreen.main.bounds.width*0.8
                LineWithSlider(pointsCount: 15, labels: ["0","1/2","2/3","3/4","","...","","","","", "", "","","","",""], maxWidth: maxWidth) { i, pointsCount in
                    let x = Double(1 - 1/Double(i+1)) * maxWidth
                    let y = 35.0
                    return CGPoint(x: x, y: y)
                }.modifier(LightGreenContainerStyle()).padding()
                Spacer()
            }
            
            NavigationLink(destination: ConvergenceExampleView().navigationBarTitle("Convergence").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).padding(10)
    }
}

struct ConvergenceExampleView: View{
    
    @State private var seqdefinition : String = "[math](a_{n})_{n∈N}[/math]"
    @State private var seqdeclaration: String = "[math]a_{n}=1-1/n[/math]"
    
    @State private var sliderValue: Double = 0.0
    
    var body: some View{
        VStack{
            VStack{
                
                Spacer()
//                HStack{
//                    Text("Consider a sequence ")
//                    TextView(string: $seqdefinition).frame(width: 100.0, height: 30.0)
//                }
                
                HStack{
                    Text("Consider a sequence given by: ").multilineTextAlignment(.center)
                    TextView(string: $seqdeclaration).frame(width: 150.0, height: 30.0)
                }
                
                let maxWidth = UIScreen.main.bounds.width*0.8
                LineWithSlider(pointsCount: 15, labels: ["","","","","","","","","","", "", "","","","",""], maxWidth: maxWidth) { i, pointsCount in
                    let x = Double(1 - 1/Double(i+1)) * maxWidth
                    let y = 35.0
                    return CGPoint(x: x, y: y)
                }.modifier(LightGreenContainerStyle()).padding()
                Text("It is clear that the value of the sequence approaches 1 as n tends to infinity. The natural question is").multilineTextAlignment(.center)
                Text("'how should we rigorously define convergence?'").bold().multilineTextAlignment(.center).padding()
                Spacer()
                
            }
            
            NavigationLink(destination: ConvergenceDefinitionView().navigationBarTitle("Subsequences").navigationBarHidden(false),label: {
                Text("Next!")
                    .modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).padding(10)
    }
}

struct ConvergenceDefinitionView: View{
    
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var epsilon: String = "[math]∀ε>0[/math]"
    @State private var bigN: String = "[math]∃N∈N[/math]"
    @State private var smallN: String = "[math]∀n≥N[/math]"
    @State private var diff: String = "[math]|a_{n}−r|<ε[/math]"
    @State private var seq: String = "[math]a_{n}[/math]"
    @State private var rvalue: String = "[math]r[/math]"
    
    @State private var showCover = false
    @State private var isPulsating = 0
    @State private var scaleFactor: CGFloat = 1.2
    
    var body: some View{
        VStack{
            VStack{
                Spacer()
                
                Text("A formal definition of convergence is as follows:")
                TextView(string: $convergencedef).frame(width: 360.0, height: 30.0).background(Color.gray.opacity(0.2)).cornerRadius(5).padding(15)
                Text("Let's break this down:")
                
                //for all epsilon view
                if isPulsating == 4{
                    HStack{
                        TextView(string: $epsilon).frame(width: 75, height: 20.0)
                        Text(" - for all positive ε,")}.modifier(PulsatingButtonCoverStyle(isPulsating: true, explanationView: AnyView(ForAllEpsilonView())))
                } else {
                    HStack{
                        TextView(string: $epsilon).frame(width: 75, height: 20.0)
                        Text(" - for all positive ε,")}.padding()
                }
                
                //there is N view
                if isPulsating == 3{
                    HStack{
                        TextView(string: $bigN).frame(width: 75, height: 20.0)
                        Text(" - there is a natural number N,")}.modifier(PulsatingButtonCoverStyle(isPulsating: true, explanationView: AnyView(ThereExistNView())))
                } else {
                    HStack{
                        TextView(string: $bigN).frame(width: 75, height: 20.0)
                        Text(" - there is a natural number N,")}.padding()
                }
                
                //for all greater than N view
                if isPulsating == 2{
                    HStack{
                        TextView(string: $smallN).frame(width: 75, height: 20.0)
                        Text(" - such that for all values n greater or equal to N,")}.modifier(PulsatingButtonCoverStyle(isPulsating: true, explanationView: AnyView(ForAllNView())))
                } else {
                    HStack{
                        TextView(string: $smallN).frame(width: 75, height: 20.0)
                        Text(" - such that for all values n greater or equal to N,")}.padding()
                }
                
                //Modulus inequality view
                if isPulsating == 1{
                    HStack{
                        Text("we have")
                        TextView(string: $diff).frame(width: 125, height: 30.0)
                    }.modifier(PulsatingButtonCoverStyle(isPulsating: true, explanationView: AnyView(Conv_DiffExplan())))
                } else {
                    HStack{
                        Text("we have")
                        TextView(string: $diff).frame(width: 125, height: 30.0)
                    }.padding()
                }
                
                Spacer()
            }.modifier(BlackDetailedAcademicTextStyle())
            
            if isPulsating<5 {
                Button(action: {isPulsating = isPulsating + 1}, label: {
                    Text("Ok?!").modifier(GreenButtonWhiteTextStyle())})
            } else {
                NavigationLink(destination: ConvergenceDefinitionQuestion1View().navigationBarTitle("Practise Convergence #1").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            }
            
        }.offset(y: -90).padding(10)
    }
}

public let labelList = [AnyView(SubscriptString(main: "a",sub: "1")),
                       AnyView(SubscriptString(main: "a",sub: "2")),
                       AnyView(SubscriptString(main: "a",sub: "3")),
                       AnyView(SubscriptString(main: "a",sub: "4")),
                       AnyView(SubscriptString(main: "a",sub: "5")),
                       AnyView(Text("")),AnyView(Text("")),AnyView(Text("")),
                       AnyView(Text("")),AnyView(Text("")),AnyView(Text("")),
                       AnyView(Text("")),AnyView(Text("")),AnyView(Text(""))]

struct ConvergenceDefinitionQuestion1View: View{
    
    @State private var seq: String = "[math](a_{n})_{n∈N}[/math]"
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var question1: String = "[math]a_{n}=1-1/n[/math]"
    @State private var question2: String = "[math]∀n≥N |a_{n}−1|<0.3[/math] ?"

    var body: some View{
        VStack{
            VStack{
                VStack{
                    Spacer()
                    
//                    HStack{
//                        Text("Recall that")
//                        TextView(string: $seq).frame(width: 80, height:30)
//                        Text("is convergent if:")}
//                    .padding(.top, 10.0)
//                    TextView(string: $convergencedef).frame(width: 360.0, height: 30.0)
//                    Spacer()
                    VStack{
                        HStack{
                            Text("For a sequence:").multilineTextAlignment(.center)
                            TextView(string: $question1).frame(width: 140.0, height: 30.0)}
                        Text("and ε = 0.3, what is the smallest value of N, such that:")
                        TextView(string: $question2).frame(width: 210.0, height: 30.0)
                    }.modifier(GrayContainerStyle(opacity: 0.25))
                    
                    LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 1, epsilon: 0.3, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                    let maxWidth = UIScreen.main.bounds.width
                                    let x = Double(1 - 1/Double(i+1)) * (maxWidth*0.8)
                                    let y = 35.0
                        return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle())
                    Spacer()
        
                    StringAnswerCheckerView(question: "", correctAnswer: "4", destinationView: AnyView(ConvergenceDefinitionQuestion2View()), destinationViewTitle: "Practise Convergence #2", explanationView: AnyView(ConvergenceDefExpl()))
                }
                
            }.modifier(BlackDetailedAcademicTextStyle())
            
        }.padding(10)
    }
}

struct ConvergenceDefinitionQuestion2View: View{
    
    @State private var seq: String = "[math](a_{n})_{n∈N}[/math]"
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var question1: String = "[math]a_{n}=1/2-1/2n[/math]"
    @State private var question2: String = "[math]∀n≥N |a_{n}−0.5|<0.2[/math] ?"

    var body: some View{
        VStack{
            VStack{
                VStack{
                    Spacer()
                    
                    VStack{
                        HStack{
                            Text("For a sequence:").multilineTextAlignment(.center)
                            TextView(string: $question1).frame(width: 190.0, height: 30.0)}
                        Text("and ε = 0.2, what is the smallest value of N, such that:")
                        TextView(string: $question2).frame(width: 210.0, height: 30.0)
                    }.modifier(GrayContainerStyle(opacity: 0.25))
                    
                    let maxWidth = UIScreen.main.bounds.width * 0.8
                    LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 0.5, epsilon: 0.2, maxWidth: maxWidth) { i, pointsCount in
                        let x = Double(0.5 - 0.5*1/Double(i+1)) * maxWidth
                        let y = 35.0
                        return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle())
        
                    Spacer()
                    StringAnswerCheckerView(question: "", correctAnswer: "3", destinationView: AnyView(Lesson1Complete(lessonManager: LessonManager())), destinationViewTitle: "", explanationView: AnyView(ConvergenceDefExpl2()))
                }
                
            }.modifier(BlackDetailedAcademicTextStyle())
            
        }.padding(10)
    }
}

struct Lesson1Complete: View {
    
    @ObservedObject var lessonManager: LessonManager
    @State private var isPressed: Bool = false
    
    var body: some View{
        
        VStack{
            Spacer()
            Text("Congratulations! You have completed the introduction to sequences and convergence!").modifier(BlackTitleTextStyle())
            Spacer()
            
            NavigationLink(destination: LessonSelectView(lessonManager: LessonManager(), isCompleted: true, completedLessonId: 1, unlockedLessonId: 2).navigationBarTitle("").navigationBarHidden(true),label: {
                Text("Great!").modifier(GreenButtonWhiteTextStyle())
            })
        }.offset(y: -90).padding(20)
    }
}

struct Lesson1View_Previews: PreviewProvider {
    static var previews: some View {
        ConvergenceIntuitionView()
        
    }
}
