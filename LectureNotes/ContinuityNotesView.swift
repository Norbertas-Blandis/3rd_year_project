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
                    destination: ContinuityIntuition1View(goNext: false).navigationBarBackButtonHidden(false).navigationBarTitle(Text("Continuity")),
                    isActive: $goToQuiz0){
                        Button(action: { goToQuiz0.toggle() }) {
                            HStack {
                                Text("Continuity").padding()
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
