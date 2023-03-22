//
//  Lesson4View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 20/03/2023.
//

import SwiftUI

struct Lesson4View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        VStack{
//            Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
            Text("Welcome to the Introduction to Continuity lesson!")
                .modifier(BlackTitleTextStyle())
            
            NavigationLink(destination: FunctionDefinitionView().navigationBarTitle("Functions").navigationBarHidden(false),label: {
                Text("Start the lesson!").modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90)
    }
}


struct FunctionDefinitionView: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var f : String = "[math]f[/math]"
    @State private var functionass : String = "[math]f(a)=1,f(b)=2,f(c)=3[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    var body: some View {
        VStack{
            VStack{
                
                //Function introduction
                Spacer()
                Text("Given two sets A and B, we can define a function").multilineTextAlignment(.center).padding()
                TextView(string: $functiondef).frame(width: 130, height: 30.0)
                Text("as a rule that assigns each element of A to an unique element of B")
                Text("For example:").bold().padding()
                
                VStack{
                    HStack{
                        //Domain
                        Button(action: {
                            withAnimation { self.isPressedShortA = true
                                self.isPressedLongA.toggle()
                            }
                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {self.isPressedShortA = false}
                          }
                        }) {
                            ZStack{
                                CircleView(color: self.isPressedLongA ? .green : .gray, size: self.isPressedShortA ? 200 : 150)
                                CircleView(color: .black, size: 10).offset(x:50, y:20)
                                CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                                CircleView(color: .black, size: 10).offset(x:-20, y:50)
                                Text("a").offset(x:60, y:30)
                                Text("b").offset(x:-50, y:-30)
                                Text("c").offset(x:-30, y:60)
                                Text("A").bold().offset(x:0, y:0).font(.system(size:32))
                            }.padding(10)
                        }
                        //Arrow
                        VStack{
                            TextView(string: $f).frame(width: 15, height: 30.0)
                            Image(systemName: "arrow.right").font(.system(size: 30))
                        }
                        //Codomain
                        Button(action: {
                            withAnimation { self.isPressedShortB = true
                                self.isPressedLongB.toggle()
                            }
                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {self.isPressedShortB = false}
                          }
                        }) {
                            ZStack{
                                CircleView(color: self.isPressedLongB ? .green : .gray, size: self.isPressedShortB ? 200 : 150)
                                CircleView(color: .black, size: 10).offset(x:50, y:20)
                                CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                                CircleView(color: .black, size: 10).offset(x:-20, y:50)
                                Text("1").offset(x:60, y:30)
                                Text("2").offset(x:-50, y:-30)
                                Text("3").offset(x:-30, y:60)
                                Text("B").bold().offset(x:0, y:0).font(.system(size:32))
                            }.padding(10)
                        }
                    }
                    TextView(string: $functionass).frame(width: 280, height: 30.0).padding()
                }.modifier(GrayContainerStyle(opacity: 0.1))
                
                Spacer()
                NavigationLink(destination: FunctionExampleView().navigationBarTitle("More on functions").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                Spacer()
            }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct FunctionExampleView: View {
    
    @State private var functionexam : String = "[math]f(x)=x^2[/math]"
    @State private var functiondef : String = "[math]f:ℝ → ℝ[/math]"
    @State private var f : String = "[math]f[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    var body: some View {
        VStack{
            VStack{
                
                //Function introduction
                Spacer()
                Text("You might be more familiar with different notation of functions, such as:").multilineTextAlignment(.center).padding()
                TextView(string: $functionexam).frame(width: 130, height: 30.0)
                Text("We could formally define this function as follows:")
                
                VStack{
                    TextView(string: $functiondef).frame(width: 130, height: 30.0).padding(.top)
                    HStack{
                        //Domain
                        Button(action: {
                            withAnimation { self.isPressedShortA = true
                                self.isPressedLongA.toggle()
                            }
                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {self.isPressedShortA = false}
                          }
                        }) {
                            ZStack{
                                CircleView(color: self.isPressedLongA ? .green : .gray, size: self.isPressedShortA ? 200 : 150)
                                Text("ℝ").bold().offset(x:0, y:0).font(.system(size:32))
                            }.padding(10)
                        }
                        //Arrow
                        VStack{
                            TextView(string: $f).frame(width: 15, height: 30.0)
                            Image(systemName: "arrow.right").font(.system(size: 30))
                        }
                        //Codomain
                        Button(action: {
                            withAnimation { self.isPressedShortB = true
                                self.isPressedLongB.toggle()
                            }
                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {self.isPressedShortB = false}
                          }
                        }) {
                            ZStack{
                                CircleView(color: self.isPressedLongB ? .green : .gray, size: self.isPressedShortB ? 200 : 150)
                                Text("ℝ").bold().offset(x:0, y:0).font(.system(size:32))
                            }.padding(10)
                        }
                    }
                    TextView(string: $functionexam).frame(width: 100, height: 30.0).padding()
                }.modifier(GrayContainerStyle(opacity: 0.1))
                
                Spacer()
                NavigationLink(destination: ContinuityIntuition1View().navigationBarTitle("Continuity intuition").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                Spacer()
            }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct ContinuityIntuition1View: View {
    
    @State private var functiondef : String = "[math]f:ℝ → ℝ, f(x)=x^2[/math]"
    
    var body: some View {
        VStack{
            VStack{
                
                //Function introduction
                Spacer()
                Text("We may intuitively understand continuity as").padding()
                Text("'The graph of a function not having any holes'").bold()
                Text("Here is an example of a continuos function:").italic().padding()
                
                VStack{
                    TextView(string: $functiondef).frame(width: 230, height: 30.0).padding()
                    FunctionPlotView(
                                formula: { x in -pow(x, 2) },
                                xMin: -1,
                                xMax: 1,
                                yMin: -1,
                                yMax: 1,
                                maxWidth: 300,
                                maxHeight: 300,
                                funcMinX: -1,
                                funcMaxX: 1,
                                deletionStart: -1,
                                deletionEnd: -1).padding(.bottom)
                }.modifier(GrayContainerStyle(opacity: 0.1))
                
                Spacer()
                NavigationLink(destination: ContinuityIntuition2View().navigationBarTitle("Continuity intuition").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                Spacer()
            }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct ContinuityIntuition2View: View {
    
    @State private var functiondef : String = "[math]f:ℝ → ℝ, f(x)=[/math]"
    @State private var bracket : String = "{"
    @State private var f1 : String = "[math]0 : x≤0[/math]"
    @State private var f2 : String = "[math]1 : x>1[/math]"
    
    let myFunc = { (x: Double) -> Double in
        if x < 0 {
            return 0
        } else{
            return -1
        }
    }
    
    var body: some View {
        VStack{
            VStack{
                
                //Function introduction
                Spacer()
                Text("While a following function is not continuous at a point 0").italic().padding()
                
                VStack{
                    HStack{
                        TextView(string: $functiondef).frame(width: 180, height: 25.0)
                        Text("{").fontWeight(.ultraLight).font(.system(size: 64)).offset(y:-10)
                        VStack{
                            TextView(string: $f1).frame(width: 110, height: 25.0)
                            TextView(string: $f2).frame(width: 110, height: 25.0)
                        }
                    }.padding()
                    FunctionPlotView(
                                formula: { x in myFunc(x) },
                                xMin: -1,
                                xMax: 1,
                                yMin: -1,
                                yMax: 1,
                                maxWidth: 300,
                                maxHeight: 300,
                                funcMinX: -1,
                                funcMaxX: 1,
                                deletionStart: -0.01,
                                deletionEnd: 0.01).padding(.bottom)
                }.modifier(GrayContainerStyle(opacity: 0.1))
                
                Spacer()
                NavigationLink(destination: ContinuityIntuition3View().navigationBarTitle("Continuity intuition").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                Spacer()
            }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct ContinuityIntuition3View: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    
    var body: some View {
        VStack{
            VStack{
                
                //Function introduction
                Spacer()
                Text("Now we are going to find out given a function").padding()
                TextView(string: $functiondef).frame(width: 120, height: 30.0)
                
                Text("How is continuity actually defined?").bold()
                
                Spacer()
                NavigationLink(destination: ContinuityDefinitionView().navigationBarTitle("Continuity intuition").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct ContinuityDefinitionView: View{
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    
    @State private var continuitydef1: String = "[math]∀ε>0,∃δ>0,∀x∈A,[/math]"
    @State private var continuitydef2: String = "[math]|x−a|<δ⇒|f(x)−f(a)|<ε[/math]"
    @State private var allepsilon: String = "[math]∀ε>0[/math]"
    @State private var existsdelta: String = "[math]∃δ>0[/math]"
    @State private var allx: String = "[math]∀x∈A[/math]"
    @State private var deltaineq: String = "[math]|x−a|<δ[/math]"
    @State private var epsilonineq: String = "[math]|f(x)−f(a)|<ε[/math]"
    
    @State private var showExplanation = false
    @State private var showNext = false
    
    var body: some View{
        VStack{
            Spacer()
            
            //Continuity definition
            Text("A formal definition of continuity is as follows:")
            HStack{
                Text("Given a function")
                TextView(string: $functiondef).frame(width: 120, height: 30.0)
            }
            Text("f is continuous at a point a∈A if:")
            VStack{
                TextView(string: $continuitydef1).frame(width: 250, height: 30.0).padding(.top)
                TextView(string: $continuitydef2).frame(width: 300, height: 30.0).padding([.bottom, .leading, .trailing])
            }.background(Color.gray.opacity(0.2)).cornerRadius(10).padding()
            
            //Lets break this down button
            if !showExplanation{
                Button(action: { withAnimation{self.showExplanation = true }}) {
                    HStack{
                        Text("Let's break this down!").foregroundColor(Color.black).bold().padding()
                    }.modifier(LightGreenButtonStyleFullFrame())}
            //Actual explanation
            } else{
                VStack{
                    //Step 1
                    HStack{
                        Text("Understanding:").bold().padding(.leading)
                        Text("What is a?")
                            .padding([.top, .bottom, .trailing])
                    }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ContinuityDefExpl1())))
                    
                    //Step 2
                    HStack{
                        Text("Understanding:").bold().padding(.leading)
                        TextView(string: $epsilonineq).frame(width: 170, height: 30.0)
                            .padding([.top, .bottom, .trailing])
                    }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ContinuityDefExpl2())))
                    
                    //Step 3
                    HStack{
                        Text("Understanding:").bold().padding(.leading)
                        TextView(string: $deltaineq).frame(width: 170, height: 30.0)
                            .padding([.top, .bottom, .trailing])
                    }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ContinuityDefExpl3())))
                    
                    //Step 4
                    HStack{
                        Text("Understanding:").bold().padding(.leading)
                        Text("The full definition")
                            .padding([.top, .bottom, .trailing])
                    }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(ContinuityDefExpl4())))
                    
                    Button("Back") {withAnimation {showExplanation = false; showNext = true}}
                }
            }
            
            if showNext{
                Spacer()
                NavigationLink(destination: ContinuityDefinitionView().navigationBarTitle("Continuity practice").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            }
            
            Spacer()
            
        }.padding(10)
    }
}

struct Lesson4View_Previews: PreviewProvider {
    static var previews: some View {
        ContinuityDefinitionView()
    }
}
