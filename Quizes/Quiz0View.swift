//
//  Quiz0View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 27/10/2022.
//

import SwiftUI

struct Quiz0View: View {
    
    @ObservedObject var quizManager: QuizManager
    
    var body: some View {
        if (quizManager.model.quizCompleted) {
            QuizCompletedView(quizManager: quizManager)
        } else {
            VStack{
                Text("Real Analysis prototype quiz")
                    .foregroundColor(Color.black)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text(quizManager.model.quizModel.question)
                    .foregroundColor(Color.black)
                    .font(.system(size: 20, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                QuizOptionGridView(quizManager: quizManager)
            }
        }
    }
}

struct Quiz0View_Previews: PreviewProvider {
    static var previews: some View {
        Quiz0View(quizManager: QuizManager())
    }
}
