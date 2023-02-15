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
    var destinationView: AnyView
    var destinationViewTitle: String
    var explanationView: AnyView
    
    @State private var input: String = ""
    @State private var showResult = false
    @State private var isAnswerCorrect = false
    @State private var showScreenCoverButton = false
    @State private var showScreenCover = false

    var body: some View {
        VStack{
            
            //Question
            Text(question)
                .modifier(BlackTitleAcademicTextStyle())
            
            //Enter the answer
            TextField("Enter answer", text: $input)
                .modifier(GrayTextFieldStyle())
            
            //Button to check if the answer is correct, if the answer has been attempted, two buttons - check answer and explanation
            if !showScreenCoverButton{
                Button(action: {
                    self.showResult = true
                    self.showScreenCoverButton = true
                    if input == correctAnswer{
                        self.isAnswerCorrect = true
                    }
                }) {
                    Text("Check Answer")
                        .modifier(GreenButtonWhiteTextStyle())
                }.padding()
            } else{
                HStack{
                    
                    if isAnswerCorrect == true{
                        
                        NavigationLink(destination: destinationView.navigationBarTitle(destinationViewTitle).navigationBarHidden(false),label: {
                            Text("Next!").modifier(GreenButtonWhiteTextStyleHalf())})
                    } else{
                        
                        Button(action: {
                            self.showResult = true
                            self.showScreenCoverButton = true
                            if input == correctAnswer{
                                self.isAnswerCorrect = true
                            }
                        }) {
                            Text("Check Answer").modifier(GreenButtonWhiteTextStyleHalf())
                        }.padding()
                    }
                    
                    Button(action: {
                        self.showScreenCover = true
                    }) {
                        Text("Explanation").modifier(GrayButtonWhiteTextStyleHalf())
                    }.padding()
                }
            }
            
            //Status of whether the answer is correct
            if showResult {
                Text(input == correctAnswer ? "Correct!" : "Incorrect")
                    .font(.headline)
                    .foregroundColor(input == correctAnswer ? .green : .red)
            }
            
            //Screen cover
            if showScreenCover {
                Button(action: {
                    self.showScreenCover = false
                }) {
                    Text("Explanatation")
                }.padding()
                .sheet(isPresented: $showScreenCover) {
                    VStack {
                        Text("This is the screen cover.").modifier(BlackTitleAcademicTextStyle())

                        Button(action: {
                            self.showScreenCover = false
                        }) {
                            Text("Understood")
                        }.padding()
                    }
                }
            }
        }
    }
}

struct LineWithExpandingPoints: View {
    
    var numOfPoints : Int
    @State private var showExpanded = false
    @State private var selectedPoint = -1
    
    var body: some View {
        ZStack {
            // Points
            ForEach(1..<numOfPoints+1) { index in
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

import RichTextView

struct TextView : UIViewRepresentable {
    
    @Binding var string : String
    
    func makeUIView(context: Context) -> RichTextView {
        let richTextView = RichTextView(
            input: string,
            latexParser: LatexParser(),
            font: UIFont.systemFont(ofSize: 18),
            textColor: UIColor.black,
            isEditable: true,
            frame: CGRect.null,
            completion: nil
        )
        
        return richTextView
        
    }

   func updateUIView(_ uiView: RichTextView, context: Context) {
        uiView.update(
            input: string,
            latexParser: LatexParser(),
            font: UIFont.systemFont(ofSize: 20),
            textColor: UIColor.black,
            completion: nil
        )
   }
}

