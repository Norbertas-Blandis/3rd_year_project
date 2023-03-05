//
//  ConvergenceDefExpl.swift
//  firstTest
//
//  Created by Norbertas Blandis on 05/03/2023.
//

import SwiftUI

struct ConvergenceDefExpl: View {
    
    @State private var question1: String = "[math]a_{n}=1-1/n[/math]"
    @State private var question2: String = "[math]∀n≥N |a_{n}−1|<0.3[/math] ?"
    
    @State private var answer1: String = "[math]a_{1}=0[/math]"
    @State private var answer2: String = "[math]a_{2}=0.5[/math]"
    @State private var answer3: String = "[math]a_{3}=0.(6)[/math]"
    @State private var answer4: String = "[math]a_{4}=0.75[/math]"
    @State private var answer5: String = "[math]a_{5}=0.8[/math]"
    
    @State private var answer11: String = "[math]|a_{1}-r|=1[/math]"
    @State private var answer22: String = "[math]|a_{2}-r|=0.5[/math]"
    @State private var answer33: String = "[math]|a_{3}-r|=0.(3)[/math]"
    @State private var answer44: String = "[math]|a_{4}-r|=0.25[/math]"
    @State private var answer55: String = "[math]|a_{5}-r|=0.2[/math]"
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Text("For a sequence:").multilineTextAlignment(.center)
                    TextView(string: $question1).frame(width: 140.0, height: 30.0)}
                Text("and ε = 0.3, what is the value of N, such that ")
                TextView(string: $question2).frame(width: 210.0, height: 30.0)
            }.modifier(GrayContainerStyle(opacity: 0.25))
            
            Text("To check it intuitively, we can simply calculate the values of first sequence elements:")
            
            HStack{
                VStack{
                    TextView(string: $answer1).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer3).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer4).frame(width: 150.0, height: 30.0)
                    TextView(string: $answer5).frame(width: 150.0, height: 30.0)
                }
                
                VStack{
                    TextView(string: $answer11).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer22).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer33).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer44).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer55).frame(width: 160.0, height: 30.0)
                }
            }
            Text("...").padding(.bottom, 10.0)
            Text("So, it is clear that from the 4th element, the convergence inequality is satisfied, so N = 4")
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceDefExpl2: View {
    
    @State private var question1: String = "[math]a_{n}=1/2-1/2n[/math]"
    @State private var question2: String = "[math]∀n≥N |a_{n}−0.5|<0.2[/math] ?"
    
    @State private var answer1: String = "[math]a_{1}=0[/math]"
    @State private var answer2: String = "[math]a_{2}=0.25[/math]"
    @State private var answer3: String = "[math]a_{3}=0.333..[/math]"
    @State private var answer4: String = "[math]a_{4}=0.375[/math]"
    @State private var answer5: String = "[math]a_{5}=0.4[/math]"
    
    @State private var answer11: String = "[math]|a_{1}-r|=1[/math]"
    @State private var answer22: String = "[math]|a_{2}-r|=0.25[/math]"
    @State private var answer33: String = "[math]|a_{3}-r|=0.166..[/math]"
    @State private var answer44: String = "[math]|a_{4}-r|=0.125[/math]"
    @State private var answer55: String = "[math]|a_{5}-r|=0.1[/math]"
    
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Text("For a sequence:").multilineTextAlignment(.center)
                    TextView(string: $question1).frame(width: 190.0, height: 30.0)}
                Text("and ε = 0.2, what is the smallest value of N, such that ")
                TextView(string: $question2).frame(width: 230.0, height: 30.0)
            }.modifier(GrayContainerStyle(opacity: 0.25))
            
            Text("To check it intuitively, we can simply calculate the values of first sequence elements:")
            
            HStack{
                VStack{
                    TextView(string: $answer1).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer2).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer3).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer4).frame(width: 160.0, height: 30.0)
                    TextView(string: $answer5).frame(width: 160.0, height: 30.0)
                }
                
                VStack{
                    TextView(string: $answer11).frame(width: 190.0, height: 30.0)
                    TextView(string: $answer22).frame(width: 190.0, height: 30.0)
                    TextView(string: $answer33).frame(width: 190.0, height: 30.0)
                    TextView(string: $answer44).frame(width: 190.0, height: 30.0)
                    TextView(string: $answer55).frame(width: 190.0, height: 30.0)
                }
            }
            Text("...").padding(.bottom, 10.0)
            Text("So, it is clear that from the 3rd element, the convergence inequality is satisfied, so N = 3")
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ConvergenceDefExpl_Previews: PreviewProvider {
    static var previews: some View {
        ConvergenceDefExpl2()
    }
}
