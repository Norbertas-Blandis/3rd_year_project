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
        ScrollView{
            Spacer()
            VStack{
                HStack{
                    Text("Given a sequence")
                    TextView(string: $question2).frame(width: 100.0, height: 30.0)
                }
                HStack{
                    Text("To calculate ")
                    TextView(string: $question3).frame(width: 100.0, height: 30.0)
                }
                Text("We have to find the fourth element of a sequence:")
                HStack{
                    LineWithExpandingPoints(numOfPoints: 5, namesOfPoints: ["1","8","27","64","125"]).offset(x:-30)
                    Text(" ... ").modifier(BlackTitleAcademicTextStyle()).offset(x: (CGFloat(4) * 50-125), y: -3)
                }
                HStack{
                    Text("So, ")
                    TextView(string: $answer).frame(width: 200.0, height: 30.0)
                }
            }.modifier(BlackTitleAcademicTextStyle()).modifier(GrayContainerStyle(opacity: 0.25))
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
        ScrollView{
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
                HStack{
                    LineWithExpandingPoints(numOfPoints: 5, namesOfPoints: ["1","1/4","1/9","1/16","1/25"]).offset(x:-30)
                    Text(" ... ").modifier(BlackTitleAcademicTextStyle()).offset(x: (CGFloat(4) * 50-125), y: -3)
                }
                HStack{
                    Text("So, ")
                    TextView(string: $answer).frame(width: 200.0, height: 30.0)
                }
                HStack{
                    Text("We get that our answer")
                    TextView(string: $question4).frame(width: 100.0, height: 25.0)
                }
            }.modifier(BlackTitleAcademicTextStyle()).modifier(GrayContainerStyle(opacity: 0.2))
            Spacer()
        }
    }
}

struct SequenceIntroExp2_Previews: PreviewProvider {
    static var previews: some View {
        SequenceIntroExp2()
    }
}
