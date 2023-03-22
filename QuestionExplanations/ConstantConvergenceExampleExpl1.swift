//
//  ConstantConvergenceExampleExpl1.swift
//  firstTest
//
//  Created by Norbertas Blandis on 13/03/2023.
//

import SwiftUI

struct ConstantConvergenceExampleExpl1: View {
    
    @State private var question1: String = "[math]a_{n}=0.5[/math]"
    
    @State private var answer1: String = "[math]a_{1}=0.5[/math]"
    @State private var answer2: String = "[math]a_{2}=0.5[/math]"
    @State private var answer3: String = "[math]a_{10}=0.5[/math]"
    @State private var answer4: String = "[math]a_{100}=0.5[/math]"
    @State private var answer5: String = "[math]a_{1000}=0.5[/math]"
    
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
                                let x = Double(0.5) * (maxWidth*0.8)
                                let y = 35.0
                    return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle())
            }
            
            StringAnswerCheckerNoExplanationView(question: "", correctAnswer: "0.5")
            
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

struct ConstantConvergenceExampleExpl2: View {
    
    @State private var question1: String = "[math]a_{n}=0.5[/math]"
    @State private var ineqfull : String = "[math]|0.5-0.5|<ε[/math]"
    
    @State private var answer1: String = "[math]|0.5-0.5|<ε[/math]"
    @State private var answer2: String = "[math]0<ε[/math]"
    
    @State private var option1: String = "[math]ε>0[/math]"
    @State private var option2: String = "[math]ε<0[/math]"
    @State private var option3: String = "[math]n>1/ε[/math]"
    @State private var option4: String = "[math]n<1/ε[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showNextQuestion = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            HStack{
                Text("We know that the sequence").multilineTextAlignment(.center)
                TextView(string: $question1).frame(width: 100.0, height: 30.0)
            }
            Text("is approaching 0.5, so we need to solve")
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
                correctAnswerIndex: 0, alignment: "h", showNextQuestion: $showNextQuestion)
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    TextView(string: $answer1).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 100.0, height: 30.0)
                }.padding(.top, 10.0).frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            //Help button
            Button(action: {showNumerical=true}, label: {
                Text("Numerical help").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConstantConvergenceExampleExpl3: View {
    
    @State private var question1: String = "[math]a_{n}=0.5[/math]"
    @State private var bigN : String = "[math]N(ε)=...+1[/math]"
    
    @State private var answer1: String = "[math]r=0.5[/math]"
    @State private var answer2: String = "[math]ε>0[/math]"
    
    @State private var option1: String = "[math]∀N∈ℕ[/math]"
    @State private var option2: String = "[math]N(ε)=1/ε+1[/math]"
    @State private var option3: String = "[math]N(ε)=1/ε-1[/math]"
    @State private var option4: String = "[math]∅[/math]"
    
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
                    TextView(string: $answer2).frame(width: 80.0, height: 20.0)
                    Text("to hold")
                }
            }
            
            Text("Which option describes all possible N values?").padding(.top)
            MultipleQuestionView(
                optionA: TextView(string: $option1).frame(width: 170, height: 25.0),
                optionB: TextView(string: $option2).frame(width: 170, height: 25.0),
                optionC: TextView(string: $option3).frame(width: 170, height: 25.0),
                optionD: TextView(string: $option4).frame(width: 170, height: 25.0),
                correctAnswerIndex: 0, alignment: "v", showNextQuestion: $showNextQuestion)
            
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
                        Stepper("", value: $epsilon, in: 0.01...Double.infinity, step: 0.05).labelsHidden()
                        Spacer()
                    }.background(Color.gray.opacity(0.2)).cornerRadius(8).padding(10)
                    
                    LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 0.5, epsilon: epsilon, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                    let maxWidth = UIScreen.main.bounds.width
                                    let x = Double(0.5) * (maxWidth*0.8)
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

struct ConstantConvergenceExampleExpl4: View {
    
    @State private var question1: String = "[math]a_{n}=0.5[/math]"
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var ineqmod : String = "[math]n>...[/math]"
    @State private var bigN : String = "[math]N(ε)=...+1[/math]"
    
    @State private var answer1: String = "[math]r=0.5[/math]"
    @State private var answer2: String = "[math]ε>0[/math]"
    @State private var answer3: String = "[math]∀N∈ℕ[/math]"
    
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
                TextView(string: $answer2).frame(width: 80.0, height: 20.0)
                Text("to hold")
            }
            HStack{
                Text("so")
                TextView(string: $answer3).frame(width: 80.0, height: 20.0)
                Text("actualy proves:")
            }
            TextView(string: $convergencedef).frame(width: 360.0, height: 30.0)
            
            //Numerical explanation
            VStack{
                Text("Try out different values of ε and notice how our formula is satisfied with every choice of N")
                    .multilineTextAlignment(.center)
                    .padding([.bottom, .top])
                
                HStack{
                    Spacer()
                    Text("ε = \(String(format: "%.2f", epsilon))")
                    Spacer()
                    Stepper("", value: $epsilon, in: 0.01...Double.infinity, step: 0.05).labelsHidden()
                    Spacer()
                    Spacer()
                }.background(Color.gray.opacity(0.2)).cornerRadius(8).padding(10)
                
                LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 0.5, epsilon: epsilon, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                let maxWidth = UIScreen.main.bounds.width
                                let x = Double(0.5) * (maxWidth*0.8)
                                let y = 35.0
                    return CGPoint(x: x, y: y)}
            }.modifier(LightGreenContainerStyle())
            
            Spacer()
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}


struct ConstantConvergenceExampleExpl1_Previews: PreviewProvider {
    static var previews: some View {
        ConstantConvergenceExampleExpl4()
    }
}
