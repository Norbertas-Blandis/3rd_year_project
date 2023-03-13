//
//  ConvergenceCalcView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 12/03/2023.
//

import SwiftUI

struct ConvergenceCalcView: View {
    
    @State private var question1: String = "[math]a_{n}=1-1/n[/math]"
    @State private var question2: String = "[math]∀n≥N |a_{n}−1|<0.3[/math] ?"
    
    @State private var answer1: String = "[math]a_{1}=0[/math]"
    @State private var answer2: String = "[math]a_{2}=0.5[/math]"
    @State private var answer3: String = "[math]a_{10}=0.9[/math]"
    @State private var answer4: String = "[math]a_{100}=0.99[/math]"
    @State private var answer5: String = "[math]a_{1000}=0.999[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showVisual: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //Introduction
            VStack{
                Text("Firstly, we need to figure out what value the sequence is approaching. Sometimes it is very clear, if not, we can calculate some elements or even plot the points:").padding()
            }.modifier(GrayContainerStyle(opacity: 0.25))
            
            Text("For example, can you figure out what value is")
            HStack{
                Text("the sequence").multilineTextAlignment(.center)
                TextView(string: $question1).frame(width: 140.0, height: 30.0)
                Text("approaching?")
            }
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    TextView(string: $answer1).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer3).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer4).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer5).frame(width: 150.0, height: 30.0)
                    Text("...").padding(.bottom, 10.0)
                    Text("It is clear that the sequence is approaching 1.").padding(.bottom, 10.0)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            //Visual explanation
            if showVisual{
                LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 1, epsilon: 2, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                let maxWidth = UIScreen.main.bounds.width
                                let x = Double(1 - 1/Double(i+1)) * (maxWidth*0.8)
                                let y = 35.0
                    return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle())
            }
            
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

struct ConvergenceCalcView2: View {
    
    @State private var question1: String = "[math]a_{n}=1-1/n[/math]"
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var ineqmod : String = "[math]n>...[/math]"
    @State private var ineqfull : String = "[math]|1-1/n-1|<ε[/math]"
    
    @State private var answer1: String = "[math]|1-1/n-1|<ε[/math]"
    @State private var answer2: String = "[math]|-1/n|<ε[/math]"
    @State private var answer3: String = "[math]1/n<ε[/math]"
    @State private var answer4: String = "[math]n>1/ε[/math]"
    
    @State private var showNumerical: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //Introduction
            VStack{
                Text("Now that we know r, we have to do some")
                HStack{
                    Text("algebra to bring the inequality ")
                    TextView(string: $ineq).frame(width: 130.0, height: 30.0)
                }
                HStack{
                    Text("to an inequality of the form:")
                    TextView(string: $ineqmod).frame(width: 70.0, height: 20.0)
                }
            }.modifier(GrayContainerStyle(opacity: 0.25))
            
            Text("Following with our previous example, we know")
                .padding(.top, 10.0)
            HStack{
                Text("that the sequence").multilineTextAlignment(.center)
                TextView(string: $question1).frame(width: 135.0, height: 30.0)
                Text("is")
            }
            Text("approaching 1, so we need to solve")
            HStack{
                TextView(string: $ineqfull).frame(width: 180.0, height: 30.0)
                Text("for n")
            }
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    TextView(string: $answer1).frame(width: 200.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer3).frame(width: 100.0, height: 30.0)
                    TextView(string: $answer4).frame(width: 80.0, height: 30.0)
                }.padding(.top, 10.0).frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            Spacer()
            
            //Help button
            Button(action: {showNumerical=true}, label: {
                Text("Numerical help").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceCalcView3: View {
    
    @State private var question1: String = "[math]a_{n}=1-1/n[/math]"
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var ineqmod : String = "[math]n>...[/math]"
    @State private var bigN : String = "[math]N(ε)=...+1[/math]"
    
    @State private var answer1: String = "[math]n>1/ε[/math]"
    @State private var answer2: String = "[math]N(ε)=1/ε+1[/math]"
    
    @State private var showNumerical: Bool = false
    
    @State private var epsilon: Double = 0.3
    
    var body: some View {
        
        VStack{
            
            Spacer()
            //Introduction
            if !showNumerical{
                VStack{
                    Text("Now that we know that")
                    HStack{
                        Text("in order for the inequality")
                        TextView(string: $ineq).frame(width: 130.0, height: 30.0)
                    }
                    HStack{
                        Text("to hold, we need")
                        TextView(string: $ineqmod).frame(width: 70.0, height: 20.0)
                    }
                    HStack{
                        Text("We can set")
                        TextView(string: $bigN).frame(width: 140.0, height: 25.0)
                    }
                }.modifier(GrayContainerStyle(opacity: 0.25))
            }
            
            //Example
            Text("Following with our previous example, we know")
                .padding(.top, 10.0)
            HStack{
                Text("that the for sequence").multilineTextAlignment(.center)
                TextView(string: $question1).frame(width: 135.0, height: 30.0)
            }
            HStack{
                Text("We need")
                TextView(string: $answer1).frame(width: 100.0, height: 30.0)
            }
            HStack{
                Text("So we may set")
                TextView(string: $answer2).frame(width: 180.0, height: 30.0)
            }
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    
                    Text("Try setting different ε values and notice how our calculated value for N makes sense.")
                        .multilineTextAlignment(.center)
                        .padding([.bottom, .top])
                    
                    HStack{
                        Spacer()
                        Text("ε = \(String(format: "%.2f", epsilon))")
                        Spacer()
                        Stepper("", value: $epsilon, in: 0.01...Double.infinity, step: 0.05).labelsHidden().padding()
                        Spacer()
                        Text("N(\(String(format: "%.2f", epsilon))) = \(String(format: "%.0f", 1/epsilon+1))")
                        Spacer()
                    }.background(Color.gray.opacity(0.2)).cornerRadius(8).padding(10)
                    LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 1, epsilon: epsilon, maxWidth: UIScreen.main.bounds.width*0.8) { i, pointsCount in
                                    let maxWidth = UIScreen.main.bounds.width
                                    let x = Double(1 - 1/Double(i+1)) * (maxWidth*0.8)
                                    let y = 35.0
                        return CGPoint(x: x, y: y)}
                }.modifier(LightGreenContainerStyle())
            }
            
            Spacer()
            
            //Help button
            Button(action: {showNumerical.toggle()}, label: {
                Text("Further Intuition").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceCalcView4: View {
    
    @State private var ineq : String = "[math]|a_{n}-r|<ε[/math]"
    @State private var convergence : String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    
    @State private var showNumerical: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //Introduction
            VStack{
                Text("Notice that for all ε>0 (no matter how small or large it gets) we have found an expression for N (that depends on ε), such that for all n>N,")
                    .padding(.top, 10.0)
                HStack{
                    Text("the inequality")
                    TextView(string: $ineq).frame(width: 130.0, height: 30.0)
                    Text("holds.")
                }
                Text("Or equivalently,")
                HStack{
                    TextView(string: $convergence).frame(width: 350.0, height: 30.0)
                }
                Text("to put it simply, to prove a sequence is convergent, we have to find a formula for N(ε) for arbitrary ε.")
                    .padding(.bottom, 10.0)
            }.modifier(GrayContainerStyle(opacity: 0.25))
            
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceCalcView_Previews: PreviewProvider {
    static var previews: some View {
        ConvergenceCalcView3()
    }
}
