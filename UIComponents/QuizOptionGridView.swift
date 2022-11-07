//
//  QuizOptionGridView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 26/10/2022.
//

import Foundation
import SwiftUI

struct QuizOptionGridView: View {
    
    var quizManager: QuizManager
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(quizManager.model.quizModel.optionList) { quizOption in
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        quizManager.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
        
    }
}

struct OptionCardView: View {
    
    var quizOption: QuizOption
    var body: some View {
        
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark")
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionStatusImageView(imageName: "")
            } else {
                OptionView(quizOption: quizOption)
            }
        }.frame(width: 150, height: 150).cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return Color.green
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct OptionView: View {
    
    var quizOption: QuizOption
    var body: some View {
        VStack {
            Text(quizOption.optionId)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .frame(width: 50, height: 50)
                .background(quizOption.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(25)
            
            Text(quizOption.option)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 159, height: 38)
        }
    }
}

struct OptionStatusImageView: View {
    
    var imageName: String
    
    var body: some View {
        
        Image(systemName: imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
            .font(.system(size:32))
            .padding()
            .foregroundColor(Color.black)
    }
}
