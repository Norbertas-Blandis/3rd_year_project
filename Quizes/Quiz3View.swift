//
//  Quiz3View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 05/11/2022.
//

import SwiftUI

struct Quiz3View: View {
    
    @ObservedObject var quizManager: QuizManager
    
    var body: some View {
        Text("Quiz 3 - working on it!")
    }
}

struct Quiz3View_Previews: PreviewProvider {
    static var previews: some View {
        Quiz3View(quizManager: QuizManager())
    }
}
