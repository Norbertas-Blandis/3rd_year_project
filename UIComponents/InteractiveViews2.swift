//
//  InteractiveViews2.swift
//  firstTest
//
//  Created by Norbertas Blandis on 21/03/2023.
//

import SwiftUI

struct FunctionPlotSliderView: View {
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
    let aVal: Double //Point of continuity
    
    @State private var xSliderValue: Double = -1.0
    
    
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
                            
                            // X axis ticks
                            Path { path in
                                path.move(to: CGPoint(x: tickX, y: geometry.size.height/2 - 5))
                                path.addLine(to: CGPoint(x: tickX, y: geometry.size.height/2 + 5))
                            }.stroke(Color.black, lineWidth: 1)
                            
                            // Y axis ticks
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
                    }.stroke(Color.black, lineWidth: 3).frame(maxWidth: maxWidth, maxHeight: maxHeight).overlay(
                        ZStack{
                            //Selected a value
                            Circle()
                                .fill(Color.red)
                                .frame(width: 15, height: 15)
                                .position(CGPoint(x: aVal*maxWidth/2+maxWidth/2, y: formula(aVal)*maxHeight/2+maxHeight/2))
                            //Movable graph point
                            Circle()
                                .fill(Color.black)
                                .frame(width: 10, height: 10)
                                .position(CGPoint(x: xSliderValue*maxWidth/2+maxWidth/2, y: formula(xSliderValue)*maxHeight/2+maxHeight/2))
                        }
                    )
                }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
                
                HStack{
                    // Slider
                    VStack {
                        Slider(value: $xSliderValue, in: -1...1, step: 0.01)
                            .frame(width: 200)
                        Text("x = \(String(format: "%.2f", xSliderValue))")
                    }
                }.modifier(GrayContainerStyle(opacity: 0.85))
                
                Spacer()
            }
        }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
    }
}

struct XYAxisView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {

        // X axis line
        Path { path in
            path.move(to: CGPoint(x: 0, y: height/2))
            path.addLine(to: CGPoint(x: width, y: height/2))
        }.stroke(Color.black, lineWidth: 1)
        
        // Y axis
        Path { path in
            path.move(to: CGPoint(x: width/2, y: 0))
            path.addLine(to: CGPoint(x: width/2, y: height))
        }.stroke(Color.black, lineWidth: 1)
    }
}

struct XYAxisTicksView: View {
    
    let width: CGFloat
    let height: CGFloat
    let xMin: Double
    let xMax: Double
    
    var body: some View {
        
        // X and Y axess ticks and labels
        let numberOfTicks = 10
        let tickSpacing = width / CGFloat(numberOfTicks)

        Group {
            ForEach(0..<11) { tickIndex in

                let tickX = CGFloat(tickIndex) * tickSpacing
                let tickLabelNumber = xMin+Double(tickIndex)*Double((xMax-xMin)/Double(numberOfTicks))
                let tickLabel = String(format: "%.1f", tickLabelNumber)

                // X axis ticks
                Path { path in
                    path.move(to: CGPoint(x: tickX, y: height/2 - 5))
                    path.addLine(to: CGPoint(x: tickX, y: height/2 + 5))
                }.stroke(Color.black, lineWidth: 1)

                // Y axis ticks
                Path { path in
                    path.move(to: CGPoint(x: width/2 - 5, y: tickX))
                    path.addLine(to: CGPoint(x: width/2 + 5, y: tickX))
                }.stroke(Color.black, lineWidth: 1)

                let tickLabelNumberY = -tickLabelNumber
                let tickLabelY = String(format: "%.1f", tickLabelNumberY)

                Text(tickLabelY)
                    .font(.caption)
                    .foregroundColor(.black)
                    .position(x: width/2 + 20, y: tickX)

                Text(tickLabel)
                    .font(.caption)
                    .foregroundColor(.black)
                    .position(x: tickX, y: height/2 + 20)
            }
        }
    }
}

struct FunctionPlotSliderEpsilonView: View {
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
    let aVal: Double //Point of continuity
    let epsilon: Double //Epsilon
    
    @State private var xSliderValue: Double = -1.0
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    
                    //X-Y axis with green epsilon interval
                    XYAxisView(width: geometry.size.width, height: geometry.size.height)
                        .overlay(
                            ZStack{
                                //The green line
                                Path { path in
                                    path.move(to: CGPoint(x: geometry.size.width/2, y: formula(aVal)*maxHeight/2+maxHeight/2-epsilon*maxHeight/2))
                                    path.addLine(to: CGPoint(x: geometry.size.width/2, y: formula(aVal)*maxHeight/2+maxHeight/2+epsilon*maxHeight/2))
                                }.stroke(Color.green, lineWidth: 3)
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                    .position(CGPoint(x: geometry.size.width/2, y: formula(aVal)*maxHeight/2+maxHeight/2))
                                Circle()
                                    .fill(formula(xSliderValue)>(formula(aVal)-epsilon) && formula(xSliderValue)<(formula(aVal)+epsilon) ? Color.green : Color.black)
                                    .frame(width: 10, height: 10)
                                    .position(CGPoint(x: geometry.size.width/2, y: formula(xSliderValue)*maxHeight/2+maxHeight/2))
                            }
                        )
                    
                    //Ticks and Labels for X-Y axis
                    XYAxisTicksView(width: geometry.size.width, height: geometry.size.height, xMin: xMin, xMax: xMax)
                    
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
                        .overlay(
                        ZStack{
                            //Selected a value
                            Circle()
                                .fill(Color.red)
                                .frame(width: 15, height: 15)
                                .position(CGPoint(x: aVal*maxWidth/2+maxWidth/2, y: formula(aVal)*maxHeight/2+maxHeight/2))
                            //Movable graph point
                            Circle()
                                .fill(formula(xSliderValue)>(formula(aVal)-epsilon) && formula(xSliderValue)<(formula(aVal)+epsilon) ? Color.green : Color.black)
                                .frame(width: 10, height: 10)
                                .position(CGPoint(x: xSliderValue*maxWidth/2+maxWidth/2, y: formula(xSliderValue)*maxHeight/2+maxHeight/2))
                        }
                    )
                    
                }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
                
                HStack{
                    // Slider
                    VStack {
                        Slider(value: $xSliderValue, in: -1...1, step: 0.01)
                            .frame(width: 200)
                        Text("x = \(String(format: "%.2f", xSliderValue))")
                    }
                }.modifier(GrayContainerStyle(opacity: 0.85))
                
                Spacer()
            }
        }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
    }
}

struct FunctionPlotSliderDeltaView: View {
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
    let aVal: Double //Point of continuity
    let epsilon: Double //Epsilon
    
    @State private var xSliderValue: Double = -1.0
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    
                    //X-Y axis with green epsilon interval
                    XYAxisView(width: geometry.size.width, height: geometry.size.height)
                    
                    //Ticks and Labels for X-Y axis
                    XYAxisTicksView(width: geometry.size.width, height: geometry.size.height, xMin: xMin, xMax: xMax)
                    
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
                        .overlay(
                        ZStack{
                            //Selected a value
                            Circle()
                                .fill(Color.red)
                                .frame(width: 15, height: 15)
                                .position(CGPoint(x: aVal*maxWidth/2+maxWidth/2, y: formula(aVal)*maxHeight/2+maxHeight/2))
                            //Movable graph point
                            Circle()
                                .fill(xSliderValue>(aVal-epsilon) && xSliderValue<(aVal+epsilon) ? Color.green : Color.black)
                                .frame(width: 10, height: 10)
                                .position(CGPoint(x: xSliderValue*maxWidth/2+maxWidth/2, y: formula(xSliderValue)*maxHeight/2+maxHeight/2))
                            //The green line
                            Path { path in
                                path.move(to: CGPoint(x: aVal*maxHeight/2+maxHeight/2-epsilon*maxHeight/2, y: geometry.size.height/2))
                                path.addLine(to: CGPoint(x: aVal*maxHeight/2+maxHeight/2+epsilon*maxHeight/2, y: geometry.size.height/2))
                            }.stroke(Color.green, lineWidth: 3)
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                                .position(CGPoint(x: aVal*maxHeight/2+maxHeight/2, y: geometry.size.height/2))
                            Circle()
                                .fill(xSliderValue>(aVal-epsilon) && xSliderValue<(aVal+epsilon) ? Color.green : Color.black)
                                .frame(width: 10, height: 10)
                                .position(CGPoint(x: xSliderValue*maxHeight/2+maxHeight/2, y:geometry.size.height/2))
                        }
                    )
                    
                }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
                
                HStack{
                    // Slider
                    VStack {
                        Slider(value: $xSliderValue, in: -1...1, step: 0.01)
                            .frame(width: 200)
                        Text("x = \(String(format: "%.2f", xSliderValue))")
                    }
                }.modifier(GrayContainerStyle(opacity: 0.85))
                
                Spacer()
            }
        }.frame(maxWidth: maxWidth, maxHeight: maxHeight)
    }
}


struct FunctionPlotSliderView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionPlotSliderDeltaView(
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
            deletionEnd: 0.01,
            aVal: 0.5,
            epsilon: 0.2)
    }
}
