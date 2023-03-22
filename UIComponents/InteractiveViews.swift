//
//  InteractiveViews.swift
//  firstTest
//
//  Created by Norbertas Blandis on 11/02/2023.
//

import SwiftUI

struct StringAnswerCheckerNoExplanationView: View {
    
    var question: String
    @State var correctAnswer: String
    
    @State private var input: String = ""
    @State private var showResult = false
    @State private var isAnswerCorrect = false

    var body: some View {
        VStack{
            
            //Question
            Text(question)
                .modifier(BlackTitleAcademicTextStyle())
            
            //Enter the answer
            TextField("Enter answer", text: $input)
                .modifier(GrayTextFieldStyle())
            
            //Button to check if the answer is correct, if the answer has been attempted, two buttons - check answer and explanation
                Button(action: {
                    self.showResult = true
                    if input == correctAnswer{
                        self.isAnswerCorrect = true
                    }
                }) {
                    Text("Check Answer")
                        .modifier(GreenButtonWhiteTextStyle())
                }.padding()
            
            //Status of whether the answer is correct
            if showResult {
                Text(input == correctAnswer ? "Correct!" : "Incorrect")
                    .font(.headline)
                    .foregroundColor(input == correctAnswer ? .green : .red)
            }
        }
    }
}

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

struct LineWithSlider: View {
    
    @State private var sliderValue: Double = 0.0
    let pointsCount: Int
    let labels: [String]
    let maxWidth: CGFloat
    let pointPosition: (Int, Int) -> CGPoint // custom formula for point position
    
    init(pointsCount: Int, labels: [String], maxWidth: CGFloat, pointPosition: @escaping (Int, Int) -> CGPoint) {
        self.pointsCount = pointsCount
        self.labels = labels
        self.maxWidth = maxWidth
        self.pointPosition = pointPosition
    }
    
    @State private var seq : String = "[math]a_{n}=[/math]"
    
    var body: some View {
        VStack {
            // X-axis
            GeometryReader { geometry in
                
                Spacer()
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
            }.frame(height: 70).padding(10)
            
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

struct ZoomableCoordinateSystemView: View {
    @State private var scale: CGFloat = 1.0
    @GestureState private var magnifyBy = CGFloat(1.0)
    
    var body: some View {
        let magnifyGesture = MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureState, _ in
                gestureState = currentState
            }
            .onEnded { scaleDelta in
                scale *= scaleDelta
            }
        
        return GeometryReader { geometry in
            Path { path in
                let xOffset = geometry.size.width / 2.0
                let yOffset = geometry.size.height / 2.0
                let xIncrement = 20.0 / scale
                let yIncrement = 20.0 / scale
                
                path.move(to: CGPoint(x: xOffset, y: 0))
                path.addLine(to: CGPoint(x: xOffset, y: geometry.size.height))
                path.move(to: CGPoint(x: 0, y: yOffset))
                path.addLine(to: CGPoint(x: geometry.size.width, y: yOffset))
                
                for x in stride(from: 0, through: geometry.size.width, by: xIncrement) {
                    path.move(to: CGPoint(x: x, y: yOffset - 5))
                    path.addLine(to: CGPoint(x: x, y: yOffset + 5))
                }
                
                for y in stride(from: 0, through: geometry.size.height, by: yIncrement) {
                    path.move(to: CGPoint(x: xOffset - 5, y: y))
                    path.addLine(to: CGPoint(x: xOffset + 5, y: y))
                }
            }
            .stroke(Color.gray, lineWidth: 1.0)
            .gesture(magnifyGesture)
        }
    }
}

struct LineWithSliderEpsilon: View {
    
    let pointsCount: Int
    let labels: [String]
    let labelViews: [AnyView]
    let rvalue: Double
    let maxWidth: CGFloat
    @State private var epsilon: Double = 0.5
    @State private var sliderValue: Double = 0.0
    let pointPosition: (Int, Int) -> CGPoint // custom formula for point position
    
    init(pointsCount: Int, labels: [String], labelViews: [AnyView], rvalue: Double, maxWidth: Double, pointPosition: @escaping (Int, Int) -> CGPoint) {
        self.pointsCount = pointsCount
        self.labels = labels
        self.labelViews = labelViews
        self.rvalue = rvalue
        self.maxWidth = maxWidth
        self.pointPosition = pointPosition
    }
    
    @State private var seq : String = "[math]<a_{n}<[/math]"
    
    var body: some View {
        VStack {
            // X-axis
            GeometryReader { geometry in
                
                Spacer()
                ZStack {
                    
                    //Create a line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        path.addLine(to: CGPoint(x: maxWidth, y: geometry.size.height/2))
                    }
                    .stroke(lineWidth: 2)
                    .overlay(
                        //The green line between the two slider points
                        Path { path in
                            path.move(to: CGPoint(x: maxWidth*rvalue-maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                            path.addLine(to: CGPoint(x: maxWidth*rvalue+maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                        }.stroke(Color.green, lineWidth: 3)
                        .overlay(
                            //The convergent and two slider points
                            VStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .position(CGPoint(x: maxWidth*rvalue, y: geometry.size.height/2))
                                Text("r").position(x: maxWidth*rvalue, y: geometry.size.height/2 - 40)
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 5, height: 5)
                                    .position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2-39))
                                    .overlay(Text("(").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2-40)))
//                                    .overlay(Text("r-\(String(format: "%.2f", epsilon))").position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2-60)))
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 5, height: 5)
                                    .position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2-59))
                                    .overlay(Text(")").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2-60)))
//                                    .overlay(Text("r+\(String(format: "%.2f", epsilon))").position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2-80)))
                            }
                        )
                        .overlay(
                            //Display the sequence points
                            ForEach(0..<pointsCount) { i in
                                VStack {
                                    let lowerBound = maxWidth*CGFloat(rvalue-epsilon)
                                    let currentX = pointPosition(i, pointsCount).x
                                    let upperBound = maxWidth*CGFloat(rvalue+epsilon)
                                    let isXInTheRange = lowerBound < currentX && currentX <
                                        upperBound
                                    Circle()
                                        .fill(isXInTheRange ? Color.green : Color.gray)
                                        .frame(width: 7, height: 7)
                                        .position(pointPosition(i, pointsCount))
//                                    Text(labels[i]).position(x: pointPosition(i, pointsCount).x, y: -18.0)
                                    labelViews[i].position(x: pointPosition(i, pointsCount).x, y: -15.0)
                                }
                            }
                        )
                    )
                    
                    //Create ticks for the line
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
            }.frame(height: 70).padding(10)
            
            // Slider
            VStack {
                Slider(value: $epsilon, in: 0...Double(0.5), step: 0.05)
                    .frame(width: 100)
                Text("ε = \(String(format: "%.2f", epsilon))")
                
//                // Box showing current point position
//                HStack{
//                    Text("r-\(String(format: "%.2f", epsilon))")
//                    TextView(string: $seq).frame(width: 70.0, height: 22.0)
//                    Text("r-\(String(format: "%.2f", epsilon))")
//                }.padding().background(Color.gray.opacity(0.2)).cornerRadius(8)
            }
        }
    }
}

struct LineWithSliderTwoPointsEpsilon: View {
    
    let pointsCount: Int
    let labels: [String]
    let labelViews: [AnyView]
    let rvalue: Double
    let svalue: Double
    let maxWidth: CGFloat
    @State private var epsilon: Double = 0.1
    @State private var sliderValue: Double = 0.0
    let pointPosition: (Int, Int) -> CGPoint // custom formula for point position
    
    init(pointsCount: Int, labels: [String], labelViews: [AnyView], rvalue: Double, svalue: Double, maxWidth: Double, pointPosition: @escaping (Int, Int) -> CGPoint) {
        self.pointsCount = pointsCount
        self.labels = labels
        self.labelViews = labelViews
        self.rvalue = rvalue
        self.svalue = svalue
        self.maxWidth = maxWidth
        self.pointPosition = pointPosition
    }
    
    @State private var seq : String = "[math]<a_{n}<[/math]"
    
    var body: some View {
        VStack {
            // X-axis
            GeometryReader { geometry in
                
                Spacer()
                ZStack {
                    
                    //Create a line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        path.addLine(to: CGPoint(x: maxWidth, y: geometry.size.height/2))
                    }
                    .stroke(lineWidth: 2)
                    .overlay(
                        //The green line between the two slider points
                        ZStack{
                            Path { path in
                                path.move(to: CGPoint(x: maxWidth*rvalue-maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                                path.addLine(to: CGPoint(x: maxWidth*rvalue+maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                            }.stroke(Color.green, lineWidth: 3)
                            Path { path in
                                path.move(to: CGPoint(x: maxWidth*svalue-maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                                path.addLine(to: CGPoint(x: maxWidth*svalue+maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                            }.stroke(Color.green, lineWidth: 3)
                        }
                        .overlay(
                            //The convergent and two slider points
                            ZStack {
                                //First convergent
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .position(CGPoint(x: maxWidth*rvalue, y: geometry.size.height/2))
                                Text("r").position(x: maxWidth*rvalue, y: geometry.size.height/2-20)
                                //Second Convergent
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .position(CGPoint(x: maxWidth*svalue, y: geometry.size.height/2))
                                Text("s").position(x: maxWidth*svalue, y: geometry.size.height/2-20)
                                //Midpoint
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .position(CGPoint(x: maxWidth*(rvalue+svalue)/2, y: geometry.size.height/2))
                                Text("(r+s)/2").position(x: maxWidth*(rvalue+svalue)/2, y: geometry.size.height/2-20)
                                //parantheses around r
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 1, height: 1)
                                    .position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2))
                                    .overlay(Text("(").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2)))
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 1, height: 1)
                                    .position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2))
                                    .overlay(Text(")").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2)))
                                //parantheses around s
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 1, height: 1)
                                    .position(CGPoint(x: maxWidth*CGFloat(svalue-epsilon), y: geometry.size.height/2))
                                    .overlay(Text("(").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(svalue-epsilon), y: geometry.size.height/2)))
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 1, height: 1)
                                    .position(CGPoint(x: maxWidth*CGFloat(svalue+epsilon), y: geometry.size.height/2))
                                    .overlay(Text(")").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(svalue+epsilon), y: geometry.size.height/2)))
                            }
                        )
                        .overlay(
                            //Display the sequence points
                            ForEach(0..<pointsCount) { i in
                                VStack {
                                    let lowerBound = maxWidth*CGFloat(rvalue-epsilon)
                                    let currentX = pointPosition(i, pointsCount).x
                                    let upperBound = maxWidth*CGFloat(rvalue+epsilon)
                                    let isXInTheRange = lowerBound < currentX && currentX <
                                        upperBound
                                    Circle()
                                        .fill(isXInTheRange ? Color.green : Color.gray)
                                        .frame(width: 7, height: 7)
                                        .position(pointPosition(i, pointsCount))
                                    labelViews[i].position(x: pointPosition(i, pointsCount).x, y: -15.0)
                                }
                            }
                        )
                    )
                    
//                    //Create ticks for the line
//                    ForEach(0..<11) { i in
//                        let tickPosition = CGPoint(x: Double(i) * Double(maxWidth/Double(10)), y: geometry.size.height/2)
//
//                        Path { path in
//                            path.move(to: tickPosition)
//                            path.addLine(to: CGPoint(x: tickPosition.x, y: tickPosition.y + 5))
//                        }
//                        .stroke(lineWidth: 1)
//
//                        let value = Double(i) / Double(10)
//                        Text(String(format: "%.1f", value))
//                            .position(x: tickPosition.x, y: tickPosition.y + 20)
//                    }
                }
            }.frame(height: 70).padding(10)
            
            // Slider
            HStack {
                Text("ε")
                Slider(value: $epsilon, in: 0...Double(0.25), step: 0.025)
                    .frame(width: 150)
            }
        }
    }
}

struct LineWithSlider_Previews: PreviewProvider {

    static var previews: some View {
        
        let maxWidth = UIScreen.main.bounds.width * 0.8
        LineWithSliderTwoPointsEpsilon(pointsCount: 0, labels: [], labelViews: [], rvalue: 0.33, svalue: 0.66, maxWidth: maxWidth) { i, pointsCount in
            let x = Double(1 - 1/Double(i+1)) * maxWidth
            let y = 35.0
            return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle()).padding(.all, 15.0)
    }
}

struct DownArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

struct LineWithSliderNValue: View {
    
    let pointsCount: Int
    let labels: [String]
    let labelViews: [AnyView]
    let rvalue: Double
    let epsilon: Double
    let maxWidth: CGFloat
    
    @State private var sliderValue: Double = 0.0
    @State private var NValue: Double = 1.0
    let pointPosition: (Int, Int) -> CGPoint // custom formula for point position
    
    init(pointsCount: Int, labels: [String], labelViews: [AnyView], rvalue: Double, epsilon: Double, maxWidth: Double, pointPosition: @escaping (Int, Int) -> CGPoint) {
        self.pointsCount = pointsCount
        self.labels = labels
        self.labelViews = labelViews
        self.rvalue = rvalue
        self.epsilon = epsilon
        self.maxWidth = maxWidth
        self.pointPosition = pointPosition
    }
    
    var body: some View {
        VStack {
            // X-axis
            GeometryReader { geometry in
                
                Spacer()
                ZStack {
                    
                    //Create a line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        path.addLine(to: CGPoint(x: maxWidth, y: geometry.size.height/2))
                    }
                    .stroke(lineWidth: 2)
                    .overlay(
                        //The green line between the two slider points
                        Path { path in
                            path.move(to: CGPoint(x: maxWidth*rvalue-maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                            path.addLine(to: CGPoint(x: maxWidth*rvalue+maxWidth*CGFloat(epsilon), y: geometry.size.height/2))
                        }.stroke(Color.green, lineWidth: 3)
                        .overlay(
                            //The convergent and two slider points
                            VStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 15, height: 15)
                                    .position(CGPoint(x: maxWidth*rvalue, y: geometry.size.height/2))
                                Text("r").position(x: maxWidth*rvalue, y: geometry.size.height/2 - 40)
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 5, height: 5)
                                    .position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2-39))
                                    .overlay(Text("(").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(rvalue-epsilon), y: geometry.size.height/2-40)))
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 5, height: 5)
                                    .position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2-59))
                                    .overlay(Text(")").font(.system(size: 30)).position(CGPoint(x: maxWidth*CGFloat(rvalue+epsilon), y: geometry.size.height/2-60)))
                            }
                        )
                        .overlay(
                            //Display the sequence points
                            ForEach(0..<pointsCount) { i in
                                VStack {
                                    let lowerBound = maxWidth*CGFloat(rvalue-epsilon)
                                    let currentX = pointPosition(i, pointsCount).x
                                    let upperBound = maxWidth*CGFloat(rvalue+epsilon)
                                    let isXInTheRange = lowerBound < currentX && currentX <
                                        upperBound
                                    Circle()
                                        .fill(isXInTheRange ? Color.green : Color.gray)
                                        .frame(width: Int(NValue)==i+1 ? 15 : 7, height: Int(NValue)==i+1 ? 15 : 7)
                                        .position(pointPosition(i, pointsCount))
//                                    Text(labels[i]).position(x: pointPosition(i, pointsCount).x, y: -18.0)
                                    labelViews[i].position(x: pointPosition(i, pointsCount).x, y: -15.0)
                                }
                                let lowerBound = maxWidth*CGFloat(rvalue-epsilon)
                                let currentX = pointPosition(Int(NValue)-1, pointsCount).x
                                let upperBound = maxWidth*CGFloat(rvalue+epsilon)
                                let isXInTheRange = lowerBound < currentX && currentX <
                                    upperBound
                                
                                DownArrowShape()
                                     .fill(isXInTheRange ? Color.green : Color.gray)
                                     .frame(width: 15, height: 50)
                                     .position(x: pointPosition(Int(NValue)-1, pointsCount).x, y: -10)
                            }
                        )
                    )
                    
                    //Create ticks for the line
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
            }.frame(height: 70).padding()
            
            HStack{
                // Slider
                VStack {
                    Slider(value: $NValue, in: 1...12, step: 1)
                        .frame(width: 100)
                    Text("N = \(String(format: "%.0f", NValue))")
                }
                
//                // Box showing current point position
//                VStack{
//                    Text("r = \(String(format: "%.2f", rvalue))")
//                    Text("ε = \(String(format: "%.2f", epsilon))")
//                    Text("N = \(String(format: "%.0f", NValue))")
//                }.padding(10).background(Color.gray.opacity(0.2)).cornerRadius(8)
            }
        }
    }
}

struct QuestionView: View {
    
    @State private var selectedAnswer: String? = nil
    @State private var showAnswer: Bool = false

    let question: String
    let correctAnswer: String
    let incorrectAnswer: String
    @Binding var showNextQuestion: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            HStack{
                Button(action: {selectedAnswer = correctAnswer}) {
                    Text(correctAnswer)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity/2)
                        .background(selectedAnswer == correctAnswer ? Color.gray : Color.gray.opacity(0.6))
                        .cornerRadius(10)
                }

                Button(action: {selectedAnswer = incorrectAnswer}) {
                    Text(incorrectAnswer)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity/2)
                        .background(selectedAnswer == incorrectAnswer ? Color.gray : Color.gray.opacity(0.6))
                        .cornerRadius(10)
                }
            }

            Button(action: {showAnswer = true
                if selectedAnswer == correctAnswer{
                    withAnimation{showNextQuestion=true}
                }}) {
                Text("Check Answer").modifier(GreenCheckAnswerButtonStyle())
            }

            if showAnswer {
                if selectedAnswer == correctAnswer {
                    Text("Correct!").foregroundColor(.green).padding(.top, 10)} else {
                    Text("Incorrect.").foregroundColor(.red).padding(.top, 10)}
            }
        }
    }
}

struct MultipleQuestionView<A: View, B: View, C: View, D: View>: View {
    
    let optionA: A
    let optionB: B
    let optionC: C
    let optionD: D
    let correctAnswerIndex: Int
    let alignment: String
    @Binding var showNextQuestion: Bool
    
    @State private var selectedOption: Int? = nil
    
    var isAnswerCorrect: Bool {
        return selectedOption == correctAnswerIndex
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            if alignment == "h"{
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    Button(action: { self.selectedOption = 0 }) {
                        AnswerOptionView(answer: optionA, isSelected: selectedOption == 0)
                    }
                    Button(action: { self.selectedOption = 1 }) {
                        AnswerOptionView(answer: optionB, isSelected: selectedOption == 1)
                    }
                    Button(action: { self.selectedOption = 2 }) {
                        AnswerOptionView(answer: optionC, isSelected: selectedOption == 2)
                    }
                    Button(action: { self.selectedOption = 3 }) {
                        AnswerOptionView(answer: optionD, isSelected: selectedOption == 3)
                    }
                }
            } else {
                Button(action: { self.selectedOption = 0 }) {
                    AnswerOptionView(answer: optionA, isSelected: selectedOption == 0)
                }
                Button(action: { self.selectedOption = 1 }) {
                    AnswerOptionView(answer: optionB, isSelected: selectedOption == 1)
                }
                Button(action: { self.selectedOption = 2 }) {
                    AnswerOptionView(answer: optionC, isSelected: selectedOption == 2)
                }
                Button(action: { self.selectedOption = 3 }) {
                    AnswerOptionView(answer: optionD, isSelected: selectedOption == 3)
                }

            }
            
            Button(action: {
                // Do nothing if no option is selected
                guard let selectedOption = selectedOption else { return }
                
                // Set the result message based on whether the answer is correct or not
                let resultMessage = isAnswerCorrect ? "Correct!" : "Incorrect."
                
                // Set the result message color based on whether the answer is correct or not
                let resultColor = isAnswerCorrect ? Color.green : Color.red
                
//                // Update the UI with the result message and color
                selectedResultView = Text(resultMessage)
                    .foregroundColor(resultColor)
                
                if isAnswerCorrect{
                    withAnimation{showNextQuestion = true}
                }
            }) {
                Text("Check Answer")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.top, 8)
            }
            // Display the result message if it's not nil
            if let selectedResultView = selectedResultView {
                selectedResultView
            }
        }
    }
    
    @State private var selectedResultView: Text? = nil
}



struct AnswerOptionView<Answer: View>: View {
    let answer: Answer
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
            answer
        }
        .foregroundColor(.primary)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
        .padding(.bottom, 8)
    }
}

struct FunctionPlotView: View {
    let formula: (Double) -> Double // Function formula
    let xMin: Double // Minimum x value
    let xMax: Double // Maximum x value
    let yMin: Double // Minimum y value
    let yMax: Double // Maximum y value
    let maxWidth: CGFloat // Maximum width of the view
    let maxHeight: CGFloat // Maximum height of the view
    let funcMinX: Double // x where function starts
    let funcMaxX: Double // x where function ends
    let deletionStart: Double // x where deletion starts
    let deletionEnd: Double // x where deletion ends
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    
                    // X axis line
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height/2))
                    }.stroke(Color.black, lineWidth: 1)
                    
                    // Y axis
                    Path { path in
                        path.move(to: CGPoint(x: geometry.size.width/2, y: 0))
                        path.addLine(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height))
                    }.stroke(Color.black, lineWidth: 1)

                    // X and Y axess ticks and labels
                    let numberOfTicks = 10
                    let tickSpacing = geometry.size.width / CGFloat(numberOfTicks)

                    Group {
                        ForEach(0..<11) { tickIndex in
                            let tickX = CGFloat(tickIndex) * tickSpacing
                            let tickLabelNumber = xMin+Double(tickIndex)*Double((xMax-xMin)/Double(numberOfTicks))
                            let tickLabel = String(format: "%.1f", tickLabelNumber)
                            
                            Path { path in
                                path.move(to: CGPoint(x: tickX, y: geometry.size.height/2 - 5))
                                path.addLine(to: CGPoint(x: tickX, y: geometry.size.height/2 + 5))
                            }.stroke(Color.black, lineWidth: 1)
                            
                            Path { path in
                                path.move(to: CGPoint(x: geometry.size.width/2 - 5, y: tickX))
                                path.addLine(to: CGPoint(x: geometry.size.width/2 + 5, y: tickX))
                            }.stroke(Color.black, lineWidth: 1)
                            
                            let tickLabelNumberY = -tickLabelNumber
                            let tickLabelY = String(format: "%.1f", tickLabelNumberY)
                            Text(tickLabelY)
                                .font(.caption)
                                .foregroundColor(.black)
                                .position(x: geometry.size.width/2 + 20, y: tickX)
                            
                            Text(tickLabel)
                                .font(.caption)
                                .foregroundColor(.black)
                                .position(x: tickX, y: geometry.size.height/2 + 20)
                        }
                    }
                    
                    // Function graph
                    Path { path in
                        let xRange = xMax - xMin
                        let yRange = yMax - yMin
                        
                        let xStep = xRange / Double(geometry.size.width)
                        let yStep = yRange / Double(geometry.size.height)
                        
                        var startedFunction = false
                        for i in 0..<Int(geometry.size.width) {
                            let x = xMin + Double(i) * xStep
                            
                            if x > -0.001 && x < 0.01{
                                startedFunction = false
                            }
                            let y = formula(x)
                            
                            let xPos = CGFloat(x - xMin) / CGFloat(xRange) * geometry.size.width
                            let yPos = CGFloat(y - yMin) / CGFloat(yRange) * geometry.size.height
                            
                            if x > funcMinX && x < funcMaxX{
                                if !startedFunction {
                                    path.move(to: CGPoint(x: xPos, y: yPos))
                                    startedFunction = true
                                } else{
                                    path.addLine(to: CGPoint(x: xPos, y: yPos))
                                }
                            }
                        }
                    }.stroke(Color.black, lineWidth: 3).frame(maxWidth: maxWidth, maxHeight: maxHeight)
                }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
                
                Spacer()
            }
        }
        .frame(maxWidth: maxWidth, maxHeight: maxHeight)
    }
}


struct FunctionPlotView_Previews: PreviewProvider {
    static var previews: some View {
        
//        let myFunc = { (x: Double) -> Double in
//            if x < 0 {
//                return 0
//            } else{
//                return -1
//            }
//        }
        
        FunctionPlotView(
            formula: { x in -pow(x,2) },
            xMin: -1,
            xMax: 1,
            yMin: -1,
            yMax: 1,
            maxWidth: 300,
            maxHeight: 300,
            funcMinX: -1,
            funcMaxX: 1,
            deletionStart: -0.01,
            deletionEnd: 0.01)
    }
}








