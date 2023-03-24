//
//  ContinuityQuizList.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/03/2023.
//

import SwiftUI

struct ContinuityQuizList: View {
    
    @State private var goToQuiz0 = false
    @State private var goToQuiz1 = false
    
    var body: some View {
        ScrollView{
            VStack{

                //Continuity quiz 1
                NavigationLink(
                    destination: ContinuityQuestion1View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Continuity excersices")),
                    isActive: $goToQuiz0){
                        Button(action: { goToQuiz0.toggle() }) {
                            HStack {
                                Text("Continuity #1").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }
                
                //Continuity quiz 2
                NavigationLink(
                    destination: ContinuityQuestion2View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Continuity excersices")),
                    isActive: $goToQuiz1){
                        Button(action: { goToQuiz1.toggle() }) {
                            HStack {
                                Text("Continuity #2").padding()
                            }.modifier(NotPulsatingButtonStyleFullFrame())
                        }.padding(.all, 5)
                }

                
            }.padding(.all, 10)
        }.accentColor(Color(.label))
    }
}

struct ContinuityQuizList_Previews: PreviewProvider {
    static var previews: some View {
        ContinuityQuizList()
    }
}
