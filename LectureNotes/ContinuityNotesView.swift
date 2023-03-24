//
//  ContinuityNotesView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/03/2023.
//

import SwiftUI

struct ContinuityNotesView: View {
    @State private var goToQuiz0 = false
    @State private var goToQuiz1 = false
    @State private var goToQuiz2 = false
    @State private var goToQuiz3 = false
    
    var body: some View {
        ScrollView{
            VStack{

                //Sets quiz 1
                NavigationLink(
                    destination: SequenceDefinitionView(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Sequences")),
                    isActive: $goToQuiz0){
                        Button(action: { goToQuiz0.toggle() }) {
                            HStack {
                                Text("Sequences").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Sets quiz 2
                NavigationLink(
                    destination: SubsequenceDefinitionView(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Subsequences")),
                    isActive: $goToQuiz1){
                        Button(action: { goToQuiz1.toggle() }) {
                            HStack {
                                Text("Subsequences").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }

                //Quantifier quiz
                NavigationLink(
                    destination: ConvergenceIntuitionView(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Convergence")),
                    isActive: $goToQuiz2){
                        Button(action: { goToQuiz2.toggle() }) {
                            HStack {
                                Text("Convergence").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Quantifier quiz
                NavigationLink(
                    destination: CalculatingConvergenceIntuitionView(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Calculating convergence")),
                    isActive: $goToQuiz3){
                        Button(action: { goToQuiz3.toggle() }) {
                            HStack {
                                Text("Calculating convergence").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
            }.padding(.all, 10)
        }.accentColor(Color(.label))
    }
}

struct ContinuityNotesView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuityNotesView()
    }
}
