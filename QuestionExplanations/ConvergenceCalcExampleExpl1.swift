//
//  ConvergenceCalcExampleExpl1.swift
//  firstTest
//
//  Created by Norbertas Blandis on 12/03/2023.
//

import SwiftUI

struct ConvergenceCalcExampleExpl1: View {
    
    @State private var question1: String = "[math]a_{n}=1/n[/math]"
    @State private var question2: String = "[math]∀n≥N |a_{n}−1|<0.3[/math] ?"
    
    @State private var answer1: String = "[math]a_{1}=1[/math]"
    @State private var answer2: String = "[math]a_{2}=0.5[/math]"
    @State private var answer3: String = "[math]a_{10}=0.1[/math]"
    @State private var answer4: String = "[math]a_{100}=0.01[/math]"
    @State private var answer5: String = "[math]a_{1000}=0.001[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showVisual: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            HStack{
                Text("What value is the sequence").multilineTextAlignment(.center)
                TextView(string: $question1).frame(width: 100.0, height: 30.0)
            }
            Text("approaching?")
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    TextView(string: $answer1).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer3).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer4).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer5).frame(width: 150.0, height: 30.0)
                    Text("...").padding(.bottom, 10.0)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            //Visual explanation
            if showVisual{
                LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 2, epsilon: 3, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                let maxWidth = UIScreen.main.bounds.width
                                let x = Double(1/Double(i+1)) * (maxWidth*0.8)
                                let y = 35.0
                    return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle())
            }
            
            StringAnswerCheckerNoExplanationView(question: "", correctAnswer: "0")
            
            Spacer()
            
            //Help button
            HStack{
                Button(action: {showVisual=true; showNumerical=false}, label: {
                    Text("Visual help").modifier(GreenHelpButtonStyle(isActivated: showVisual))})
                Spacer()
                Button(action: {showNumerical=true; showVisual=false}, label: {
                    Text("Numerical help").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
            }
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceCalcExampleExpl2: View {
    
    @State private var question1: String = "[math]a_{n}=1/n[/math]"
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var ineqmod : String = "[math]n>...[/math]"
    @State private var ineqfull : String = "[math]|1/n-0|<ε[/math]"
    
    @State private var answer1: String = "[math]|1/n-0|<ε[/math]"
    @State private var answer2: String = "[math]1/n<ε[/math]"
    @State private var answer3: String = "[math]n>1/ε[/math]"
    
    @State private var option1: String = "[math]n<ε[/math]"
    @State private var option2: String = "[math]n<1/ε[/math]"
    @State private var option3: String = "[math]n>ε[/math]"
    @State private var option4: String = "[math]n>1/ε[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showNextQuestion = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            VStack{
                HStack{
                    Text("We know that the sequence").multilineTextAlignment(.center)
                    TextView(string: $question1).frame(width: 100.0, height: 30.0)
                }
                Text("is approaching 0, so we need to solve")
                HStack{
                    TextView(string: $ineqfull).frame(width: 150.0, height: 30.0)
                    Text("for n")
                }
                
                Text("Which one is the correct derivation?").padding(.top)
                MultipleQuestionView(
                    optionA: TextView(string: $option1).frame(width: 70, height: 20.0),
                    optionB: TextView(string: $option2).frame(width: 90, height: 25.0),
                    optionC: TextView(string: $option3).frame(width: 70, height: 20.0),
                    optionD: TextView(string: $option4).frame(width: 90, height: 25.0),
                    correctAnswerIndex: 3, alignment: "h", showNextQuestion: $showNextQuestion).padding()
            }.padding()
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    TextView(string: $answer1).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 100.0, height: 30.0)
                    TextView(string: $answer3).frame(width: 90.0, height: 30.0)
                }.padding(.top, 10.0).frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            Spacer()
            
            //Help button
            Button(action: {showNumerical=true}, label: {
                Text("Numerical help").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceCalcExampleExpl3: View {
    
    @State private var question1: String = "[math]a_{n}=1/n[/math]"
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var ineqmod : String = "[math]n>...[/math]"
    @State private var bigN : String = "[math]N(ε)=...+1[/math]"
    
    @State private var answer1: String = "[math]r=0[/math]"
    @State private var answer2: String = "[math]n>1/ε[/math]"
    
    @State private var option1: String = "[math]N(ε)=1/ε[/math]"
    @State private var option2: String = "[math]N(ε)=1/ε+1[/math]"
    @State private var option3: String = "[math]N(ε)=1/ε-1[/math]"
    @State private var option4: String = "[math]N(ε)=ε[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showNextQuestion = false
    
    @State private var epsilon: Double = 0.3
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            if !showNumerical{
                //Example
                HStack{
                    Text("We know that the sequence").multilineTextAlignment(.center)
                    TextView(string: $question1).frame(width: 135.0, height: 30.0)
                }
                HStack{
                    Text("is approaching")
                    TextView(string: $answer1).frame(width: 60.0, height: 20.0)
                    Text("and for any ε")
                }
                HStack{
                    Text("we need")
                    TextView(string: $answer2).frame(width: 80.0, height: 30.0)
                    Text("to hold")
                }
            }
            
            Text("Which one is a sensible choice for N?").padding(.top)
            MultipleQuestionView(
                optionA: TextView(string: $option1).frame(width: 170, height: 25.0),
                optionB: TextView(string: $option2).frame(width: 170, height: 25.0),
                optionC: TextView(string: $option3).frame(width: 170, height: 25.0),
                optionD: TextView(string: $option4).frame(width: 170, height: 25.0),
                correctAnswerIndex: 1, alignment: "v", showNextQuestion: $showNextQuestion)
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    
                    Text("What values for N make sense?")
                        .multilineTextAlignment(.center)
                        .padding([.bottom, .top])
                    
                    HStack{
                        Spacer()
                        Text("ε = \(String(format: "%.2f", epsilon))")
                        Spacer()
                        Stepper("", value: $epsilon, in: 0.01...Double.infinity, step: 0.05).labelsHidden().padding(5)
                        Spacer()
                    }.background(Color.gray.opacity(0.2)).cornerRadius(8).padding(10)
                    
                    LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 0, epsilon: epsilon, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                    let maxWidth = UIScreen.main.bounds.width
                                    let x = Double(1/Double(i+1)) * (maxWidth*0.8)
                                    let y = 35.0
                        return CGPoint(x: x, y: y)}
                }.modifier(LightGreenContainerStyle())
            }
            
            Spacer()
            
            //Help button
            Button(action: {showNumerical.toggle()}, label: {
                Text("Visual help").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceCalcExampleExpl4: View {
    
    @State private var question1: String = "[math]a_{n}=1/n[/math]"
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var ineqmod : String = "[math]n>...[/math]"
    @State private var bigN : String = "[math]N(ε)=...+1[/math]"
    
    @State private var answer1: String = "[math]r=0[/math]"
    @State private var answer2: String = "[math]n>1/ε[/math]"
    @State private var answer3: String = "[math]N(ε)=1/ε+1[/math]"
    
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    
    @State private var epsilon: Double = 0.3
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //Example
            HStack{
                Text("We know that the sequence").multilineTextAlignment(.center)
                TextView(string: $question1).frame(width: 135.0, height: 30.0)
            }
            HStack{
                Text("is approaching")
                TextView(string: $answer1).frame(width: 60.0, height: 20.0)
                Text("and for any ε")
            }
            HStack{
                Text("we need")
                TextView(string: $answer2).frame(width: 80.0, height: 30.0)
                Text("to hold")
            }
            HStack{
                Text("so by choosing")
                TextView(string: $answer3).frame(width: 200.0, height: 30.0)
            }
            Text("we actualy prove:")
            TextView(string: $convergencedef).frame(width: 360.0, height: 30.0)
            
            //Numerical explanation
            VStack{
                Text("Try out different values of ε and notice how our formula for N make sense")
                    .multilineTextAlignment(.center)
                    .padding([.bottom, .top])
                
                HStack{
                    Spacer()
                    Text("ε = \(String(format: "%.2f", epsilon))")
                    Spacer()
                    Stepper("", value: $epsilon, in: 0.01...Double.infinity, step: 0.05).labelsHidden().padding(5)
                    Spacer()
                    Text("N(\(String(format: "%.2f", epsilon))) = \(String(format: "%.0f", 1/epsilon+1))")
                    Spacer()
                }.background(Color.gray.opacity(0.2)).cornerRadius(8).padding(10)
                
                LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 0, epsilon: epsilon, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                let maxWidth = UIScreen.main.bounds.width
                                let x = Double(1/Double(i+1)) * (maxWidth*0.8)
                                let y = 35.0
                    return CGPoint(x: x, y: y)}.padding(.leading)
            }.modifier(LightGreenContainerStyle())
            
            Spacer()
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}


struct ConvergenceCalcExampleExpl1_Previews: PreviewProvider {
    static var previews: some View {
        ConvergenceCalcExampleExpl4()
    }
}
