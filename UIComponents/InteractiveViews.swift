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
                        AnyView(explanationView)

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
    var namesOfPoints: Array<String>
    
    @State private var showExpanded = false
    @State private var selectedPoint = -1
    
    var body: some View {
        ZStack {
            // Points
            ForEach(1..<numOfPoints+1) { index in
                Circle()
                    .fill(namesOfPoints[index-1] == "" ? Color.white : Color.black)
                    .frame(width: self.showExpanded && self.selectedPoint == index ? 20 : 10,
                           height: self.showExpanded && self.selectedPoint == index ? 20 : 10)
                    .offset(x: (CGFloat(index) * 50 - 125))
                    .onTapGesture {
                        self.selectedPoint = index
                        self.showExpanded = true
                    }
                Text("\(namesOfPoints[index-1])").offset(x: (CGFloat(index) * 50 - 125), y: -20).modifier(BlackDetailedAcademicTextStyle())
//                TextView(string: $namesOfPoints[index-1]).offset(x: (CGFloat(index) * 50 - 125), y: -20).modifier(BlackDetailedAcademicTextStyle())
            }
        }
    }
}

extension UIFont {
    var bold: UIFont { return withWeight(.bold) }
    var semibold: UIFont { return withWeight(.semibold) }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

        traits[.weight] = weight

        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName

        let descriptor = UIFontDescriptor(fontAttributes: attributes)

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}

import RichTextView

struct TextView : UIViewRepresentable {
    
    @Binding var string : String
    
    func makeUIView(context: Context) -> RichTextView {
        let richTextView = RichTextView(
            input: string,
            latexParser: LatexParser(),
            font: UIFont.init(descriptor: UIFontDescriptor(name: "American Typewriter", size: 24.0), size: 20),
            textColor: UIColor.black,
            isEditable: false,
            frame: CGRect.null,
            completion: nil
        )
        return richTextView
    }

   func updateUIView(_ uiView: RichTextView, context: Context) {
        uiView.update(
            input: string,
            latexParser: LatexParser(),
            font: UIFont.italicSystemFont(ofSize: 20),
            textColor: UIColor.black,
            completion: nil
        )
   }
}

struct CircleView: View {
    
    var color: Color
    var size: CGFloat
    
    var body: some View {
        ZStack{
            Circle().frame(width: size, height: size).foregroundColor(color)
        }
    }
}

struct DraggableCircleView: View {
    
    var color: Color
    var size: CGFloat
    var text: String
    @State private var position = CGPoint.zero
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: size, height: size)
                .foregroundColor(color)
                .position(position)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.position = value.location
                        })
            
            Text(text).position(position)
        }
    }
}

struct EllipseView: View {
    
    var color: Color
    var sizeX: CGFloat
    var sizeY: CGFloat
    
    var body: some View {
        ZStack{
            Ellipse()
                .strokeBorder(.black, lineWidth: 1)
                .background(Ellipse().fill(color))
                .frame(width: sizeX, height: sizeY)
        }
    }
}

//struct LineWithSlider: View {
//    @State private var sliderValue: Double = 0.0
//    let pointsCount: Int
//    let labels: [String]
//
//    init(pointsCount: Int, labels: [String]) {
//        self.pointsCount = pointsCount
//        self.labels = labels
//    }
//
//    var body: some View {
//        VStack {
//            // X-axis
//            GeometryReader { geometry in
//                Path { path in
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height/2))
//                }
//                .stroke(lineWidth: 2)
//                .overlay(
//                    ForEach(0..<pointsCount) { i in
//                        VStack {
//                            Circle()
//                                .fill(i == Int(sliderValue) ? Color.red : Color.gray)
//                                .frame(width: i == Int(sliderValue) ? 10 : 6, height: i == Int(sliderValue) ? 10 : 6)
//                                .position(x: Double(i) * geometry.size.width / Double(pointsCount - 1), y: geometry.size.height/2)
//                            Text(labels[i]).position(x: Double(i) * geometry.size.width / Double(pointsCount - 1), y: geometry.size.height/3)
//                        }
//                    }
//                )
//            }.frame(height: 70)
//
//            // Slider
//            VStack {
//                Slider(value: $sliderValue, in: 0...Double(pointsCount - 1), step: 1)
//                    .frame(width: 100)
//                Text("n=\(Int(sliderValue))")
//            }
//        }
//    }
//}

struct LineWithSlider: View {
    @State private var sliderValue: Double = 0.0
    let pointsCount: Int
    let labels: [String]
    let pointPosition: (Int, Int) -> CGPoint // custom formula for point position
    
    init(pointsCount: Int, labels: [String], pointPosition: @escaping (Int, Int) -> CGPoint) {
        self.pointsCount = pointsCount
        self.labels = labels
        self.pointPosition = pointPosition
    }
    
    let maxWidth = UIScreen.main.bounds.width - 50
    let minTickValue = 0
    let maxTickValue = 1
    
    @State private var seq : String = "[math]a_{n}=[/math]"
    
    var body: some View {
        VStack {
            // X-axis
            GeometryReader { geometry in
                ZStack {
                    
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        path.addLine(to: CGPoint(x: maxWidth, y: geometry.size.height/2))
                    }
                    .stroke(lineWidth: 2)
                    .overlay(
                        ForEach(0..<pointsCount) { i in
                            VStack {
                                Circle()
                                    .fill(i == Int(sliderValue) ? Color.red : Color.gray)
                                    .frame(width: i == Int(sliderValue) ? 12 : 8, height: i == Int(sliderValue) ? 12 : 8)
                                    .position(pointPosition(i, pointsCount))
                                Text(labels[i]).position(x: pointPosition(i, pointsCount).x, y: -20.0)
                            }
                        }
                    )
                    
                    ForEach(0..<11) { i in
                        let tickPosition = CGPoint(x: Double(i) * Double(maxWidth/Double(10)), y: geometry.size.height/2)
                        
                        Path { path in
                            path.move(to: tickPosition)
                            path.addLine(to: CGPoint(x: tickPosition.x, y: tickPosition.y + 5))
                        }
                        .stroke(lineWidth: 1)
                        
                        let value = Double(i) / Double(10)
                        Text(String(format: "%.1f", value))
                            .position(x: tickPosition.x, y: tickPosition.y + 20)
                    }
                }
            }.frame(height: 70)
            
            HStack{
                // Slider
                VStack {
                    Slider(value: $sliderValue, in: 0...Double(pointsCount - 1), step: 1)
                        .frame(width: 100)
                    Text("n=\(Int(sliderValue))")
                }.padding()
                
                // Box showing current point position
                HStack{
                    TextView(string: $seq).frame(width: 50.0, height: 20.0)
                    Text("\(pointPosition(Int(sliderValue), pointsCount).x / maxWidth)")
                }.padding().background(Color.gray.opacity(0.2)).cornerRadius(8)
            }
        }
    }
}









struct LineWithSlider_Previews: PreviewProvider {
    
    static var previews: some View {
        LineWithSlider(pointsCount: 10, labels: ["0","1/2","3/4","4/5","4","5","","....","",""]) { i, pointsCount in
            let maxWidth = UIScreen.main.bounds.width
            let x = Double(1 - 1/Double(i+1)) * (maxWidth-50)
            let y = 35.0
            return CGPoint(x: x, y: y)
        }
        
    }
}

//x = Double(i) * 360 / Double(pointsCount - 1)

//            let x = Double(1-Double(1/(i+1))) * 200// custom formula for x-position
//            let y = sin(x * .pi / 100) * 20 + 35 // custom formula for y-position






