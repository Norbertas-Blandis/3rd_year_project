//
//  ContinuityDefExpl1.swift
//  firstTest
//
//  Created by Norbertas Blandis on 21/03/2023.
//

import SwiftUI

struct ContinuityDefExpl1: View {
    
    @State private var alla: String = "[math]a∈A[/math]"
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var continuitydef1: String = "[math]∀ε>0,∃δ>0,∀x∈A,[/math]"
    @State private var continuitydef2: String = "[math]|x−a|<δ⇒|f(x)−f(a)|<ε[/math]"
    @State private var allepsilon: String = "[math]∀ε>0[/math]"
    @State private var existsdelta: String = "[math]∃δ>0[/math]"
    @State private var allx: String = "[math]∀x∈A[/math]"
    @State private var deltaineq: String = "[math]|x−a|<δ[/math]"
    @State private var epsilonineq: String = "[math]|f(x)−f(a)|<ε[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            HStack{
                Text("Given a function")
                TextView(string: $functiondef).frame(width: 120, height: 30.0)}
            HStack{
                Text("We will take a specific")
                TextView(string: $alla).frame(width: 50, height: 20.0)
                Text("and prove that")}
            Text("the function is continuous at the point a.")
            HStack{
                Text("In other words, Continuity is a")
                Text("Local Property").bold()}.padding([.top, .bottom])
            
            VStack{
                FunctionPlotSliderView(
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
                    aVal: 0).padding([.bottom, .top])
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            Text("Notice how as x approaches 0, it does not 'jump around' - this is the intuitive way to determine a function is continuous at 0.").italic()
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ContinuityDefExpl2: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var continuitydef1: String = "[math]∀ε>0,∃δ>0,∀x∈A,[/math]"
    @State private var continuitydef2: String = "[math]|x−a|<δ⇒|f(x)−f(a)|<ε[/math]"
    @State private var allepsilon: String = "[math]∀ε>0[/math]"
    @State private var existsdelta: String = "[math]∃δ>0[/math]"
    @State private var allx: String = "[math]∀x∈A[/math]"
    @State private var deltaineq: String = "[math]|x−a|<δ[/math]"
    @State private var epsilonineq: String = "[math]|f(x)−f(a)|<ε[/math]"
    @State private var fa: String = "[math]f(a)[/math]"
    @State private var fx: String = "[math]f(x)[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //Introduction
            VStack{
                HStack{
                    Text("The part")
                    TextView(string: $epsilonineq).frame(width: 170, height: 30.0)}
                Text("Should be understood as how close the value of")
                HStack{
                    TextView(string: $fx).frame(width: 45, height: 30.0)
                    Text("is to the value of")
                    TextView(string: $fa).frame(width: 45, height: 30.0)
                }
            }
            
            //Graph
            VStack{
                FunctionPlotSliderEpsilonView(
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
                    epsilon: 0.2).padding([.bottom, .top])
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            //Aditional question
            VStack{
                Text("Here ε = 0.2 is set, could you determine for what values of x is the inequality").italic()
                TextView(string: $epsilonineq).frame(width: 170, height: 30.0)
                Text("satisfied?").italic()
                Text("(x values for which the point lights up green will satisfy the inequality)").italic()
            }
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ContinuityDefExpl3: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var continuitydef1: String = "[math]∀ε>0,∃δ>0,∀x∈A,[/math]"
    @State private var continuitydef2: String = "[math]|x−a|<δ⇒|f(x)−f(a)|<ε[/math]"
    @State private var allepsilon: String = "[math]∀ε>0[/math]"
    @State private var existsdelta: String = "[math]∃δ>0[/math]"
    @State private var allx: String = "[math]∀x∈A[/math]"
    @State private var deltaineq: String = "[math]|x−a|<δ[/math]"
    @State private var epsilonineq: String = "[math]|f(x)−f(a)|<ε[/math]"
    @State private var a: String = "[math]a[/math]"
    @State private var x: String = "[math]x[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //Introduction
            VStack{
                HStack{
                    Text("The part")
                    TextView(string: $deltaineq).frame(width: 170, height: 30.0)}
                Text("Should be understood as how close the value of")
                HStack{
                    TextView(string: $x).frame(width: 20, height: 12)
                    Text("is to the value of")
                    TextView(string: $a).frame(width: 20, height: 12)
                }
            }
            
            //Graph
            VStack{
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
                    epsilon: 0.2).padding([.bottom, .top])
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            //Aditional question
            VStack{
                Text("Here δ = 0.2 is set, could you determine for what values of x is the inequality").italic()
                TextView(string: $deltaineq).frame(width: 170, height: 30.0)
                Text("satisfied?").italic()
                Text("(x values for which the point lights up green will satisfy the inequality)").italic()
            }
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ContinuityDefExpl4: View {
    
    @State private var alla: String = "[math]a∈A[/math]"
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var continuitydef1: String = "[math]∀ε>0,∃δ>0,∀x∈A,[/math]"
    @State private var continuitydef2: String = "[math]|x−a|<δ⇒|f(x)−f(a)|<ε[/math]"
    @State private var allepsilon: String = "[math]∀ε>0[/math]"
    @State private var existsdelta: String = "[math]∃δ>0[/math]"
    @State private var allx: String = "[math]∀x∈A[/math]"
    @State private var deltaineq: String = "[math]|x−a|<δ[/math]"
    @State private var epsilonineq: String = "[math]|f(x)−f(a)|<ε[/math]"
    @State private var a: String = "[math]a[/math]"
    @State private var x: String = "[math]x[/math]"
    @State private var fa: String = "[math]f(a)[/math]"
    @State private var fx: String = "[math]f(x)[/math]"
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Putting all the pieces together we should interpret the definition:")
            VStack{
                TextView(string: $continuitydef1).frame(width: 250, height: 30.0).padding(.top)
                TextView(string: $continuitydef2).frame(width: 300, height: 30.0).padding([.bottom, .leading, .trailing])
            }.background(Color.gray.opacity(0.2)).cornerRadius(10)
            Text("as follows:")
            
            VStack{
                HStack{
                    Text("No matter how small ε gets - ")
                    TextView(string: $allepsilon).frame(width: 75, height: 20.0)}.padding()
                HStack{
                    Text("There is a positive δ - ")
                    TextView(string: $existsdelta).frame(width: 70, height: 20.0)}
                HStack{
                    Text("Such that for all")
                    TextView(string: $x).frame(width: 15, height: 12.0)
                    Text("that are close to")
                    TextView(string: $a).frame(width: 15, height: 12.0)
                    Text(" - ")}.padding(.top)
                HStack{
                    TextView(string: $allx).frame(width: 70, height: 20.0)
                    TextView(string: $deltaineq).frame(width: 100, height: 30.0)
                }
                HStack{
                    Text("the output")
                    TextView(string: $fx).frame(width: 45, height: 30.0)
                    Text("will be close to")
                    TextView(string: $fa).frame(width: 45, height: 30.0)
                    Text(" - ")}.padding(.top)
                TextView(string: $epsilonineq).frame(width: 170, height: 30.0)
            }
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct ContinuityDefExpl1_Previews: PreviewProvider {
    static var previews: some View {
        ContinuityDefExpl4()
    }
}
