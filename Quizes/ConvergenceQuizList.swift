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
    @State private var goToQuiz4 = false
    @State private var goToQuiz5 = false
    
    var body: some View {
        ScrollView{
            VStack{

                //Sequences quiz 1
                NavigationLink(
                    destination: AnswerChecker1View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Sequence excersices")),
                    isActive: $goToQuiz0){
                        Button(action: { goToQuiz0.toggle() }) {
                            HStack {
                                Text("Sequences #1").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Sequences quiz 2
                NavigationLink(
                    destination: AnswerChecker2View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Sequence excersices")),
                    isActive: $goToQuiz1){
                        Button(action: { goToQuiz1.toggle() }) {
                            HStack {
                                Text("Sequences #2").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Convergence quiz 1
                NavigationLink(
                    destination: ConvergenceDefinitionQuestion1View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence excersices")),
                    isActive: $goToQuiz2){
                        Button(action: { goToQuiz2.toggle() }) {
                            HStack {
                                Text("Convergence #1").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Convergence quiz 2
                NavigationLink(
                    destination: ConvergenceDefinitionQuestion2View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence excersices")),
                    isActive: $goToQuiz3){
                        Button(action: { goToQuiz3.toggle() }) {
                            HStack {
                                Text("Convergence #2").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Convergence quiz 3
                NavigationLink(
                    destination: ConvergenceDefinitionQuestion3View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence excersices")),
                    isActive: $goToQuiz4){
                        Button(action: { goToQuiz4.toggle() }) {
                            HStack {
                                Text("Convergence #3").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Convergence quiz 4
                NavigationLink(
                    destination: ConvergenceDefinitionQuestion4View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence excersices")),
                    isActive: $goToQuiz5){
                        Button(action: { goToQuiz5.toggle() }) {
                            HStack {
                                Text("Convergence #4").padding()
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
