//
//  SequenceIntroExp.swift
//  firstTest
//
//  Created by Norbertas Blandis on 15/02/2023.
//

import SwiftUI

struct SequenceIntroExp1: View {
    
    @State private var answer : String = "[math]a_{4} = 4^3 = 64[/math]"
    @State private var question1 : String = "[math](a_{n})_{n∈N}[/math]"
    @State private var question2 : String = "[math]a_{n}=n^3[/math]"
    @State private var question3 : String = "[math]a_{4}[/math]"
    
    var body: some View {
        
        VStack{
            Spacer()
            
            VStack{
                
                //Question
                HStack{
                    Text("Given a sequence")
                    TextView(string: $question2).frame(width: 100.0, height: 30.0)
                }
                HStack{
                    Text("To calculate ")
                    TextView(string: $question3).frame(width: 100.0, height: 25.0)
                }
                Text("We have to find the fourth element of a sequence:")
                
                //Graph
                let maxWidth = UIScreen.main.bounds.width*0.8
                LineWithSlider(pointsCount: 6, labels: ["","","","","","","","","","", "", "","","","",""], xMax: 100.0, xMin: 0.0, maxWidth: maxWidth, roundFull: true, multiply: 100) { i, pointsCount in
                    let x = Double(pow(CGFloat(i),3))/100.0 * maxWidth
                    let y = 35.0
                    return CGPoint(x: x, y: y)
                }.modifier(LightGreenContainerStyle())
                
            }.modifier(BlackTitleAcademicTextStyle()).modifier(GrayContainerStyle(opacity: 0.2)).padding()
            
            Spacer()
        }
    }
}

struct SequenceIntroExp2: View {
    
    @State private var answer : String = "[math]a_{5} = 1/25[/math]"
    @State private var question2 : String = "[math]a_{n}=1/(n^2)[/math]"
    @State private var question3 : String = "[math]a_{x}=1/25[/math]"
    @State private var question4 : String = "[math]x=5[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            VStack{
                HStack{
                    Text("Given a sequence")
                    TextView(string: $question2).frame(width: 150.0, height: 30.0)
                }
                HStack{
                    Text("And")
                    TextView(string: $question3).frame(width: 150.0, height: 30)
                }
                Text("We have to find WHICH element is 1/25:")
                //Graph
                let maxWidth = UIScreen.main.bounds.width*0.8
                LineWithSlider(pointsCount: 8, labels: ["","1/1","1/4","1/9","","...","","","","", "", "","","","",""], xMax: 1.0, xMin: 0.0, maxWidth: maxWidth, roundFull: false, multiply: 1) { i, pointsCount in
                    let x = Double(1/pow(CGFloat(i),2)) * maxWidth
                    let y = 35.0
                    return CGPoint(x: x, y: y)
                }.modifier(LightGreenContainerStyle())
                
            }.modifier(BlackTitleAcademicTextStyle()).modifier(GrayContainerStyle(opacity: 0.2)).padding()
            
            Spacer()
            
        }
    }
}

struct SequenceIntroExp2_Previews: PreviewProvider {
    static var previews: some View {
        SequenceIntroExp2()
    }
}
