//
//  Lesson2View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 05/11/2022.
//

import SwiftUI

struct Lesson2View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        VStack{
//            Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
            Text("Welcome to the Using convergence lesson!")
                .modifier(BlackTitleTextStyle())
            
            NavigationLink(destination: CalculatingConvergenceIntuitionView().navigationBarTitle("Convergence").navigationBarHidden(false),label: {
                Text("Start the lesson!").modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90)
    }
}

struct CalculatingConvergenceIntuitionView: View {
    
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var bigN: String = "[math]N(ε)[/math]"
    
    @State private var showStep1Explanation = false
    @State private var showStep2Explanation = false
    @State private var showStep3Explanation = false
    
    @State private var isPulsating = 0
    
    var body: some View {
        VStack{
            VStack{
                
                Spacer()
                Text("We know the definition of convergence and have some intuition of what it means, in this lesson we will learn").multilineTextAlignment(.center).padding()
                Text("How can we rigorously prove a sequence is convergent").bold().multilineTextAlignment(.center)
                Spacer()
                
                VStack{
                    
                    //Step 1 pulsating view
                    if isPulsating == 1{
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Find value r we are appraching")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcView())))
                    } else {
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Find value r we are appraching")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcView())))
                    }
                    
                    //Step 2 pulsating view
                    if isPulsating == 2{
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Solve")
                            TextView(string: $ineq).frame(width: 125.0, height: 30.0)
                            Text("for n").padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcView2())))
                    } else {
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Solve")
                            TextView(string: $ineq).frame(width: 125.0, height: 30.0)
                            Text("for n").padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcView2())))
                    }
                    
                    //Step 3 pulsating view
                    if isPulsating == 3{
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Find an expression for ")
                            TextView(string: $bigN).frame(width: 50.0, height: 30.0)
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcView3())))
                    } else {
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Find an expression for ")
                            TextView(string: $bigN).frame(width: 50.0, height: 30.0)
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcView3())))
                    }
                    
                    //Step 4 pulsating view
                    if isPulsating == 4{
                        HStack{
                            Text("Step 4:").bold().padding(.leading)
                            Text("Check it all makes sense")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcView4())))
                    } else {
                        HStack{
                            Text("Step 4:").bold().padding(.leading)
                            Text("Check it all makes sense")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcView4())))
                    }
                }
                
                Spacer()
                if isPulsating<5 {
                    Button(action: {isPulsating = isPulsating + 1}, label: {
                        Text("Next").modifier(GreenButtonWhiteTextStyle())})
                } else {
                    NavigationLink(destination: ConvergenceDefinitionQuestion3View().navigationBarTitle("Practise Convergence #1").navigationBarHidden(false),label: {
                        Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                }
                Spacer()
                
            }
        }.padding(15)
    }
}



struct ConvergenceDefinitionQuestion3View: View{
    
    @State private var seq: String = "[math](a_{n})_{n∈N}[/math]"
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈ℕ,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var question1: String = "[math]a_{n}=1/n[/math]"
    @State private var question2: String = "[math]|a_{n}−r|<ε[/math]"
    
    @State private var rstring = "[math]r=0[/math]"
    @State private var Nstring = "[math]N=1/ε+1[/math]"
    @State private var equalstring = "[math]|a_{n}|<ε,∀n>N[/math]"
    
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var bigN: String = "[math]N(ε)[/math]"
    
    @State private var openVisual: Bool = false
    @State private var openNumerical: Bool = false
    
    @State private var isPulsating: Int = 0

    var body: some View{
        VStack{
                VStack{
                    Spacer()
                    
                    //Question
                    VStack{
                        HStack{
                            Text("Given a sequence:").multilineTextAlignment(.center)
                            TextView(string: $question1).frame(width: 100.0, height: 30.0)}
                        Text("Follow the four steps to prove that it is convergent")
                    }.modifier(GrayContainerStyle(opacity: 0.25))
                    
                    //Step 1 pulsating view
                    if isPulsating == 1{
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Find value r we are appraching")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcExampleExpl1())))
                    } else {
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Find value r we are appraching")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcExampleExpl1())))
                    }
                    
                    //Step 2 pulsating view
                    if isPulsating == 2{
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Solve")
                            TextView(string: $ineq).frame(width: 125.0, height: 30.0)
                            Text("for n").padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcExampleExpl2())))
                    } else {
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Solve")
                            TextView(string: $ineq).frame(width: 125.0, height: 30.0)
                            Text("for n").padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcExampleExpl2())))
                    }
                    
                    //Step 3 pulsating view
                    if isPulsating == 3{
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Find an expression for ")
                            TextView(string: $bigN).frame(width: 50.0, height: 30.0)
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcExampleExpl3())))
                    } else {
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Find an expression for ")
                            TextView(string: $bigN).frame(width: 50.0, height: 30.0)
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcExampleExpl3())))
                    }
                    
                    //Step 4 pulsating view
                    if isPulsating == 4{
                        HStack{
                            Text("Step 4:").bold().padding(.leading)
                            Text("Check it all makes sense")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConvergenceCalcExampleExpl4())))
                    } else {
                        HStack{
                            Text("Step 4:").bold().padding(.leading)
                            Text("Check it all makes sense")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConvergenceCalcExampleExpl4())))
                    }
                    
                    Spacer()
                    if isPulsating<5 {
                        Button(action: {isPulsating = isPulsating + 1}, label: {
                            Text("Next").modifier(GreenButtonWhiteTextStyle())})
                    } else {
                        NavigationLink(destination: ConvergenceDefinitionQuestion4View().navigationBarTitle("Practise Convergence #2").navigationBarHidden(false),label: {
                            Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                    }
                    Spacer()
                }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct ConvergenceDefinitionQuestion4View: View{
    
    @State private var seq: String = "[math](a_{n})_{n∈N}[/math]"
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈ℕ,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var nonconvergencedef: String = "[math]∃ε>0,∀N∈ℕ,∃n≥N |a_{n}−r|≥ε[/math]"
    
    @State private var question1: String = "[math]a_{n}=0.5[/math]"
    @State private var question2: String = "[math]|a_{n}−r|<ε[/math]"
    
    @State private var rstring = "[math]r=0[/math]"
    @State private var Nstring = "[math]N=1/ε+1[/math]"
    @State private var equalstring = "[math]|a_{n}|<ε,∀n>N[/math]"
    
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var bigN: String = "[math]N(ε)[/math]"
    
    @State private var openVisual: Bool = false
    @State private var openNumerical: Bool = false
    
    @State private var isPulsating: Int = 0

    var body: some View{
        VStack{
                VStack{
                    Spacer()
                    
                    //Question
                    VStack{
                        HStack{
                            Text("Given a constant sequence:").multilineTextAlignment(.center)
                            TextView(string: $question1).frame(width: 100.0, height: 30.0)}
                        Text("Follow the four steps to prove that it is convergent")
                    }.modifier(GrayContainerStyle(opacity: 0.25))
                    
                    //Step 1 pulsating view
                    if isPulsating == 1{
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Find value r we are appraching")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConstantConvergenceExampleExpl1())))
                    } else {
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Find value r we are appraching")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConstantConvergenceExampleExpl1())))
                    }

                    //Step 2 pulsating view
                    if isPulsating == 2{
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Solve")
                            TextView(string: $ineq).frame(width: 125.0, height: 30.0)
                            Text("for n").padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConstantConvergenceExampleExpl2())))
                    } else {
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Solve")
                            TextView(string: $ineq).frame(width: 125.0, height: 30.0)
                            Text("for n").padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConstantConvergenceExampleExpl2())))
                    }

                    //Step 3 pulsating view
                    if isPulsating == 3{
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Find an expression for ")
                            TextView(string: $bigN).frame(width: 50.0, height: 30.0)
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConstantConvergenceExampleExpl3())))
                    } else {
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Find an expression for ")
                            TextView(string: $bigN).frame(width: 50.0, height: 30.0)
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConstantConvergenceExampleExpl3())))
                    }

                    //Step 4 pulsating view
                    if isPulsating == 4{
                        HStack{
                            Text("Step 4:").bold().padding(.leading)
                            Text("Check it all makes sense")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(PulsatingButtonCoverStyleFullFrame(isPulsating: true, explanationView: AnyView(ConstantConvergenceExampleExpl4())))
                    } else {
                        HStack{
                            Text("Step 4:").bold().padding(.leading)
                            Text("Check it all makes sense")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ConstantConvergenceExampleExpl4())))
                    }
                    
                    Spacer()
                    if isPulsating<5 {
                        Button(action: {isPulsating = isPulsating + 1}, label: {
                            Text("Next").modifier(GreenButtonWhiteTextStyle())})
                    } else {
                        NavigationLink(destination: Lesson2Complete(lessonManager: LessonManager()).navigationBarTitle("").navigationBarHidden(false),label: {
                            Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                    }
                    Spacer()
                }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct Lesson2Complete: View {
    
    @ObservedObject var lessonManager: LessonManager
    @State private var isPressed: Bool = false
    
    var body: some View{
        
        VStack{
            Spacer()
            Text("Congratulations! You have completed the more on Convergence lesson!").modifier(BlackTitleTextStyle())
            Spacer()
            
            NavigationLink(destination: LessonSelectView(lessonManager: LessonManager(), isCompleted: true, completedLessonId: 1, unlockedLessonId: 2).navigationBarTitle("").navigationBarHidden(true),label: {
                Text("Great!").modifier(GreenButtonWhiteTextStyle())
            })
        }.offset(y: -90).padding(20)
    }
}

struct Lesson2View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2Complete(lessonManager: LessonManager())
    }
}
