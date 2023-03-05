//
//  Conv:DiffExplan.swift
//  firstTest
//
//  Created by Norbertas Blandis on 26/02/2023.
//

import SwiftUI

struct Conv_DiffExplan: View {
    
    @State private var diff: String = "[math]|a_{n}−r|<ε[/math]"
    @State private var equiv: String = "[math]⇔[/math]"
    @State private var diffexp: String = "[math]-ε<a_{n}−r<ε[/math]"
    @State private var diffan: String = "[math]r-ε<a_{n}<ε+r[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            HStack{
                Text("Think of ")
                TextView(string: $diff).frame(width: 110, height: 30.0)
                Text("as a how 'how close")
            }.padding([.top, .leading, .trailing], 5.0)
            
            Text("our sequence value is to the value - r we are approaching', because:").multilineTextAlignment(.center)
            
            HStack{
                Spacer()
                TextView(string: $diff).frame(width: 110, height: 30.0)
                Spacer()}
            
            HStack{
                Spacer()
                TextView(string: $equiv).frame(width: 45, height: 30.0)
                Spacer()}
            
            HStack{
                Spacer()
                TextView(string: $diffexp).frame(width: 160, height: 30.0)
                Spacer()}
            
            HStack{
                Spacer()
                TextView(string: $equiv).frame(width: 45, height: 30.0)
                Spacer()}
            
            HStack{
                Spacer()
                TextView(string: $diffan).frame(width: 200, height: 30.0)
                Spacer()}
            
            let maxWidth = UIScreen.main.bounds.width * 0.8
            LineWithSliderEpsilon(pointsCount: 0, labels: [], labelViews: [], rvalue: 0.5, maxWidth: maxWidth) { i, pointsCount in
                let x = Double(1 - 1/Double(i+1)) * maxWidth
                let y = 35.0
                return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle()).padding(.all, 15.0)
            
            Spacer()
        }
    }
}

struct ForAllNView: View {
    
    @State private var forall: String = "[math]∀n≥N |a_{n}−r|<ε[/math]"
    @State private var diff: String = "[math]|a_{n}−r|<ε[/math]"
    @State private var equiv: String = "[math]⇔[/math]"
    @State private var diffan: String = "[math]r-ε<a_{n}<ε+r[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            HStack{
                Text("Now ")
                TextView(string: $forall).frame(width: 190, height: 30.0)
                Text("means that")
            }.padding([.top, .leading, .trailing], 5.0)

            Text("for all n, greater than some natural number N, we want to have:").multilineTextAlignment(.center).padding(.horizontal, 10.0)

            HStack{
                Spacer()
                TextView(string: $diff).frame(width: 110, height: 30.0)
                Spacer()}

            HStack{
                Spacer()
                TextView(string: $equiv).frame(width: 45, height: 30.0)
                Spacer()}
            
            HStack{
                Spacer()
                TextView(string: $diffan).frame(width: 200, height: 30.0)
                Spacer()}
            
            Text("The sequence points that are coloured green satisfy this inequality").multilineTextAlignment(.center).padding(.horizontal, 10.0)
            
            let labelList = [AnyView(SubscriptString(main: "a",sub: "1")),
                             AnyView(SubscriptString(main: "a",sub: "2")),
                             AnyView(SubscriptString(main: "a",sub: "3")),
                             AnyView(SubscriptString(main: "a",sub: "4")),
                             AnyView(SubscriptString(main: "a",sub: "5")),
                             AnyView(Text("")),AnyView(Text("")),AnyView(Text("")),
                             AnyView(Text("")),AnyView(Text("")),AnyView(Text("")),
                             AnyView(Text("")),AnyView(Text("")),AnyView(Text(""))]
            
            let maxWidth = UIScreen.main.bounds.width * 0.8
            LineWithSliderNValue(pointsCount: 12, labels: [], labelViews: labelList, rvalue: 1, epsilon: 0.4, maxWidth: maxWidth) { i, pointsCount in
                            let x = Double(1 - 1/Double(i+1)) * maxWidth
                            let y = 35.0
                return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle()).padding(.all, 15.0)
            
            Text("Here ε = 0.4 is set, and notice that all sequence points from the third one are in the interval, so N = 3").multilineTextAlignment(.center).padding(.horizontal, 10.0)
            Spacer()
        }
    }
}

struct ThereExistNView: View {
    
    @State private var thereis: String = "[math]∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var forall: String = "[math]∀n≥N |a_{n}−r|<ε[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            HStack{
                TextView(string: $thereis).frame(width: 270, height: 30.0)
                Text("means that")
            }.padding([.top, .leading, .trailing], 5.0)

            Text("for the given sequence we CAN find a natural number N, such that ").multilineTextAlignment(.center).padding(.horizontal, 10.0)

            HStack{
                Spacer()
                TextView(string: $forall).frame(width: 190, height: 30.0)
                Spacer()}
            
            let labelList = [AnyView(SubscriptString(main: "a",sub: "1")),
                             AnyView(SubscriptString(main: "a",sub: "2")),
                             AnyView(SubscriptString(main: "a",sub: "3")),
                             AnyView(SubscriptString(main: "a",sub: "4")),
                             AnyView(SubscriptString(main: "a",sub: "5")),
                             AnyView(SubscriptString(main: "a",sub: "6")),
                             AnyView(SubscriptString(main: "a",sub: "7")),
                             AnyView(Text("")),AnyView(Text("")),AnyView(Text("")),
                             AnyView(Text("")),AnyView(Text("")),AnyView(Text("")),
                             AnyView(Text("")),AnyView(Text("")),AnyView(Text(""))]
            
            let maxWidth = UIScreen.main.bounds.width * 0.8
            LineWithSliderNValue(pointsCount: 15, labels: [], labelViews: labelList, rvalue: 0.5, epsilon: 0.3, maxWidth: maxWidth) { i, pointsCount in
                let x = Double(0.5 - (pow(-1, Double(i)))*(1/Double(i+2))) * maxWidth
                let y = 35.0
                return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle()).padding(.all, 15.0)
            
            Text("Here ε = 0.3 is set, can you find a value of N, such that the inequality is satisfied? (all elements of the sequence indexed by N or larger are green)").multilineTextAlignment(.center).padding(.horizontal, 10.0)
            
            Spacer()
        }
    }
}

struct ForAllEpsilonView: View {
    
    @State private var forallepsilon: String = "[math]∀ε>0,∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var thereis: String = "[math]∃N∈N,∀n≥N |a_{n}−r|<ε[/math]"
    @State private var forall: String = "[math]∀n≥N |a_{n}−r|<ε[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            HStack{
                TextView(string: $forallepsilon).frame(width: 350, height: 30.0)
            }.padding([.top, .leading, .trailing], 5.0)

            Text("means that FOR ALL ε (no matter how small it gets), for the given sequence we CAN find a natural number N, such that ").multilineTextAlignment(.center).padding(.horizontal, 10.0)

            HStack{
                Spacer()
                TextView(string: $forall).frame(width: 190, height: 30.0)
                Spacer()}
            
            let maxWidth = UIScreen.main.bounds.width * 0.8
            LineWithSliderEpsilon(pointsCount: 16, labels: [], labelViews: labelList, rvalue: 0.5, maxWidth: maxWidth) { i, pointsCount in
                let x = Double(0.5 - (1/Double(i+2))) * maxWidth
                let y = 35.0
                return CGPoint(x: x, y: y)}.modifier(LightGreenContainerStyle()).padding(.all, 15.0)
            
            Text("Try decreasing ε value and notice that no matter how small it gets, we can still find N, such that all sequence elements indexed by N or greater are coloured green - so the sequence is convergent").multilineTextAlignment(.center).padding(.horizontal, 10.0)
            
            Spacer()
        }
    }
}

struct Conv_DiffExplan_Previews: PreviewProvider {
    static var previews: some View {
        ForAllNView()
    }
}
