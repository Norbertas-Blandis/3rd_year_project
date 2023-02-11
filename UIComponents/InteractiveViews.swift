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
            // Line
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0.5))
                path.addLine(to: CGPoint(x: 1, y: 0.5))
            }
            .stroke(lineWidth: 2)
            .frame(width: 300, height: 100)
            
            // Points
            ForEach(0..<4) { index in
                Circle()
                    .fill(Color.black)
                    .frame(width: self.showExpanded && self.selectedPoint == index ? 20 : 10,
                           height: self.showExpanded && self.selectedPoint == index ? 20 : 10)
                    .offset(x: (CGFloat(index) * 0.2 + 0.1) * 300, y: 50)
                    .onTapGesture {
                        self.selectedPoint = index
                        self.showExpanded = true
                    }
            }
        }
    }
}

