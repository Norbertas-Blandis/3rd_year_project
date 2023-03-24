//
//  PrerequisitesNotesList.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/03/2023.
//

import SwiftUI

struct PrerequisitesNotesList: View {
    
    @State private var goToQuiz0 = false
    @State private var goToQuiz1 = false
    @State private var goToQuiz2 = false
    @State private var goToQuiz3 = false
    
    var body: some View {
        ScrollView{
            VStack{

                //Sets quiz 1
                NavigationLink(
                    destination: Lesson0_1(isNotes: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Sets")),
                    isActive: $goToQuiz0){
                        Button(action: { goToQuiz0.toggle() }) {
                            HStack {
                                Text("Sets").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Sets quiz 2
                NavigationLink(
                    destination: Lesson0_8(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Quantifiers")),
                    isActive: $goToQuiz1){
                        Button(action: { goToQuiz1.toggle() }) {
                            HStack {
                                Text("Quantifiers").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Quantifier quiz
                NavigationLink(
                    destination: Lesson0_10(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Functions")),
                    isActive: $goToQuiz2){
                        Button(action: { goToQuiz2.toggle() }) {
                            HStack {
                                Text("Functions").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
            }.padding(.all, 10)
        }.accentColor(Color(.label))
    }
}

struct PrerequisitesNotesList_Previews: PreviewProvider {
    static var previews: some View {
        PrerequisitesNotesList()
    }
}
