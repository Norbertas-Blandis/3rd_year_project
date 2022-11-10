//
//  QuizCompletedView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 26/10/2022.
//

import SwiftUI

struct QuizCompletedView: View {
    
    var quizManager: QuizManager
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Quiz Completed!")
                    .foregroundColor(Color.black)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
        }
    }
    
    func goToMainHandler(){
        
        var body: some View {
            LandingPage()
        }
    }
}

struct QuizCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCompletedView(quizManager: QuizManager())
    }
}
