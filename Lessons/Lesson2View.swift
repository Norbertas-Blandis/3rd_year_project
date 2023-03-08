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
            
            NavigationLink(destination: ConvergenceDefinitionQuestion3View().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Start the lesson!").modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90)
    }
}

struct ConvergenceDefinitionQuestion3View: View{
    
    @State private var seq: String = "[math](a_{n})_{n∈N}[/math]"
    @State private var convergencedef: String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var question1: String = "[math]a_{n}=1/n[/math]"
    @State private var question2: String = "[math]|a_{n}−r|<ε[/math]"
    
    @State private var rstring = "[math]r=0[/math]"
    @State private var Nstring = "[math]N=1/ε+1[/math]"
    @State private var equalstring = "[math]|a_{n}|<ε,∀n>N[/math]"
    
    @State private var openVisual: Bool = false
    @State private var openNumerical: Bool = false

    var body: some View{
        VStack{
                VStack{
                    Spacer()
                    
                    //Question
                    VStack{
                        HStack{
                            Text("For a sequence:").multilineTextAlignment(.center)
                            TextView(string: $question1).frame(width: 100.0, height: 30.0)}
                        Text("Is this a convergent sequence?")
                    }.modifier(GrayContainerStyle(opacity: 0.25))
                    
                    if openVisual{
                        let maxWidth = UIScreen.main.bounds.width * 0.8
                        LineWithSliderEpsilon(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 0, maxWidth: maxWidth) { i, pointsCount in
                            let x = Double(1/Double(i+1)) * maxWidth
                            let y = 35.0
                            return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle())}
                    
                    if openNumerical{
                        //Recall definition
                        VStack{
                            HStack{
                                Text("Recall that")
                                TextView(string: $seq).frame(width: 80, height:30)
                                Text("is convergent if:")}
                            TextView(string: $convergencedef).frame(width: 360.0, height: 30.0)
                            
                            HStack{
                                Text("Notice that here ")
                                TextView(string: $rstring).frame(width: 80, height:20)}
                            HStack{
                                Text("Fix ε>0, consider ")
                                TextView(string: $Nstring).frame(width: 140, height:23)}
                            HStack{
                                Text("Prove:")
                                TextView(string: $equalstring).frame(width: 175, height:30)}
                        }.modifier(LightGreenContainerStyle())
                    }
                    
                    QuestionView(question: "", correctAnswer: "Yes", incorrectAnswer: "No")
                    Spacer()
                    
                    //Help button
                    HStack{
                        Button(action: {openVisual=true; openNumerical=false}, label: {
                            Text("Visual help").modifier(GreenHelpButtonStyle(isActivated: openVisual))})
                        Spacer()
                        Button(action: {openNumerical=true; openVisual=false}, label: {
                            Text("Numerical help").modifier(GreenHelpButtonStyle(isActivated: openNumerical))})
                    }
                }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct Lesson2View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2View(lessonId: 2, lessonManager: LessonManager())
    }
}
