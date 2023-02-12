//
//  InteractiveViews.swift
//  firstTest
//
//  Created by Norbertas Blandis on 11/02/2023.
//

import SwiftUI

struct StringAnswerCheckerView: View {
    
    var question: String
    @State var correctAnswer: String
    
    @State private var input: String = ""
    @State private var showResult = false
    
    var body: some View {
        VStack{
            
            Text(question)
                .modifier(BlackTitleAcademicTextStyle())
            
            TextField("Enter answer", text: $input)
                .modifier(GrayTextFieldStyle())
            
            Button(action: {
                self.showResult = true
            }) {
                Text("Check Answer")
                    .modifier(GreenButtonWhiteTextStyle())
            }
            .padding()
            
            if showResult {
                Text(input == correctAnswer ? "Correct!" : "Incorrect")
                    .font(.headline)
                    .foregroundColor(input == correctAnswer ? .green : .red)
            }
        }
    }
}

struct LineWithExpandingPoints: View {
    
    @State private var showExpanded = false
    @State private var selectedPoint = -1
    
    var body: some View {
        ZStack {
            // Points
            ForEach(1..<5) { index in
                Circle()
                    .fill(Color.black)
                    .frame(width: self.showExpanded && self.selectedPoint == index ? 20 : 10,
                           height: self.showExpanded && self.selectedPoint == index ? 20 : 10)
                    .offset(x: (CGFloat(index) * 50 - 125))
                    .onTapGesture {
                        self.selectedPoint = index
                        self.showExpanded = true
                    }
                Text("\(index)").offset(x: (CGFloat(index) * 50 - 125), y: -20).modifier(BlackDetailedAcademicTextStyle())
            }
        }
    }
}

