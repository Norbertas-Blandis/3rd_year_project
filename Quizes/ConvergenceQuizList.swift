//
//  ConvergenceQuizList.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/03/2023.
//

import SwiftUI

struct ConvergenceQuizList: View {
    
    @State private var goToQuiz0 = false
    @State private var goToQuiz1 = false
    @State private var goToQuiz2 = false
    @State private var goToQuiz3 = false
    
    var body: some View {
        ScrollView{
            VStack{

                //Sets quiz 1
                NavigationLink(
                    destination: Lesson0_6(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Set excersices")),
                    isActive: $goToQuiz0){
                        Button(action: { goToQuiz0.toggle() }) {
                            HStack {
                                Text("Sets #1").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Sets quiz 2
                NavigationLink(
                    destination: Lesson0_7(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Set excersices")),
                    isActive: $goToQuiz1){
                        Button(action: { goToQuiz1.toggle() }) {
                            HStack {
                                Text("Sets #2").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Quantifier quiz
                NavigationLink(
                    destination: Lesson0_9(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Quantifier excersices")),
                    isActive: $goToQuiz2){
                        Button(action: { goToQuiz2.toggle() }) {
                            HStack {
                                Text("Quantifiers").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Function quiz
                NavigationLink(
                    destination: Lesson0_14(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Function excersices")),
                    isActive: $goToQuiz3){
                        Button(action: { goToQuiz3.toggle() }) {
                            HStack {
                                Text("Functions").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
            }.padding(.all, 10)
        }.accentColor(Color(.label))
    }
}

struct ConvergenceQuizList_Previews: PreviewProvider {
    static var previews: some View {
        ConvergenceQuizList()
    }
}
