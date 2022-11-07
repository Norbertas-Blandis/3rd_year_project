//
//  Quiz2View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 05/11/2022.
//

import SwiftUI

struct Quiz2View: View {
    
    @ObservedObject var quizManager: QuizManager
    
    var body: some View {
        Text("Quiz 2 - working on it!")
    }
}

struct Quiz2View_Previews: PreviewProvider {
    static var previews: some View {
        Quiz2View(quizManager: QuizManager())
    }
}
