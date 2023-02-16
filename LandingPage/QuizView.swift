//
//  QuizView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 25/10/2022.
//

import SwiftUI

struct QuizView: View {
    
    @State private var goToQuiz1 = false
    @State private var goToQuiz2 = false
    @State private var goToQuiz3 = false
    
    @State private var isQuiz1Unlocked = true
    @State private var isQuiz2Unlocked = false
    @State private var isQuiz3Unlocked = false
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                VStack{
                    
                    NavigationLink(
                        destination: Quiz0View(quizManager: QuizManager()),
                        isActive: $goToQuiz1){
                            Button(action: isQuiz1Unlocked ? {goToQuiz1.toggle()} : {}) {
                                HStack{
                                    Text("1. Prerequisites")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Text("10 min").padding()
                                    Spacer()
                                    Image(systemName:isQuiz1Unlocked ? "lock.open" : "lock").padding()
                                }.padding(8)
                                .border(Color.black, width: 2)
                                .cornerRadius(10)
                            }
                    }
                    
                    NavigationLink(
                        destination: Quiz2View(quizManager: QuizManager()),
                        isActive: $goToQuiz2){
                            Button(action: isQuiz2Unlocked ? {goToQuiz2.toggle()} : {}) {
                                HStack{
                                    Text("2. Basic sequences")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Text("10 min").padding()
                                    Spacer()
                                    Image(systemName:isQuiz2Unlocked ? "lock.open" : "lock").padding()
                                }.padding(8)
                                .border(Color.black, width: 2)
                                .cornerRadius(10)
                            }
                    }
                    
                    NavigationLink(
                        destination: Quiz3View(quizManager: QuizManager()),
                        isActive: $goToQuiz3){
                            Button(action: isQuiz3Unlocked ? {goToQuiz3.toggle()} : {}) {
                                HStack{
                                    Text("3. Sequence examples")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Text("10 min").padding()
                                    Spacer()
                                    Image(systemName:isQuiz3Unlocked ? "lock.open" : "lock").padding()
                                }.padding(8)
                                .border(Color.black, width: 2)
                                .cornerRadius(10)
                            }
                    }
                    
                }.padding(10)
                
            }.navigationTitle("Excercises")
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
