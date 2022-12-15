//
//  Lesson0View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 27/10/2022.
//

import SwiftUI

struct Lesson0View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
                    .foregroundColor(Color.black)
                    .font(.system(size: 32))
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: Lesson0_1().navigationBarTitle("").navigationBarHidden(false), label: {
                    Text("Start the lesson!")
                        .bold().frame(width: 280, height: 50)
                        .background(Color.green).foregroundColor(.white)
                        .cornerRadius(10)
                })
            }.offset(y: -90)
        }.accentColor(Color(.label))
    }
}

struct Lesson0_1: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("A set is just a collection of items.\nFor example: A = {a, b, c} is a set with elements a, b, c. ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 24)).multilineTextAlignment(.center).padding()
            
            
            Button(action: {
                withAnimation { self.isPressedShort = true
                    self.isPressedLong.toggle()
                }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {self.isPressedShort = false}
              }
            }) {
                ZStack{
                    CircleView(color: self.isPressedLong ? .green : .gray, size: self.isPressedShort ? 250 : 200)
                    CircleView(color: .black, size: 10).offset(x:50, y:20)
                    CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                    CircleView(color: .black, size: 10).offset(x:-20, y:50)
                    Text("a").offset(x:60, y:30)
                    Text("b").offset(x:-50, y:-30)
                    Text("c").offset(x:-30, y:60)
                    Text("A").bold().offset(x:0, y:0).font(.system(size:32))
                }.padding(10)
            }
            
            Spacer()
            
            NavigationLink(destination: Lesson0_2().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .bold().frame(width: 280, height: 50)
                    .background(Color.green).foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.offset(y: -90)
    }
}

struct Lesson0_2: View {
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false

    var body: some View {
        VStack{
            
            Spacer()
            
            Text("Elements of a set can be anything: points in space, numbers, fruits, sets, ...\n For example:").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Button(action: {
                withAnimation { self.isPressedShort = true
                    self.isPressedLong.toggle()
                }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {self.isPressedShort = false}
              }
            }) {
                ZStack{
                    CircleView(color: self.isPressedLong ? .green : .gray, size: self.isPressedShort ? 250 : 200)
                    Text("{a, b}").bold().offset(x:60, y:30)
                    Text("Banana").bold().offset(x:-40, y:-50)
                    Text("1000").bold().offset(x:-30, y:60)
                    Image(systemName: "gamecontroller").resizable().frame(width: 30, height: 20).offset(x:50, y:-50)
                    Text("B").bold().offset(x:0, y:0).font(.system(size:32))
                }.padding(10)
            }
            
            Text("B = { {a,b}, Banana, 1000, \(Image(systemName: "gamecontroller")) } ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Spacer()
            
            NavigationLink(destination: Lesson0_3().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .bold().frame(width: 280, height: 50)
                    .background(Color.green).foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.offset(y: -90)
    }
}

struct Lesson0_3: View {
    
    @State private var isPressedCShort = false
    @State private var isPressedCLong = false
    
    @State private var isPressedRShort = false
    @State private var isPressedRLong = false
    
    @State private var isPressedQShort = false
    @State private var isPressedQLong = false
    
    @State private var isPressedZShort = false
    @State private var isPressedZLong = false
    
    @State private var isPressedNShort = false
    @State private var isPressedNLong = false

    var body: some View {
        VStack{
            
            Spacer()
            
            Text("You have probably already come across some sets in the past: C, R, Q, Z, N").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            ZStack{
                
                Button(action: {
                    withAnimation {self.isPressedCShort = true
                        self.isPressedCLong.toggle()
                    }
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {self.isPressedCShort = false}
                  }
                }) {
                    EllipseView(color: self.isPressedCLong ? .green : .gray, sizeX: 350, sizeY: 300)
                }.contentShape(Circle())
                
                Text("C").bold().offset(x:150, y:-50).font(.system(size:32))
                
                Button(action: {
                    withAnimation {self.isPressedRShort = true
                        self.isPressedRLong.toggle()
                    }
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {self.isPressedRShort = false}
                  }
                }){
                    EllipseView(color: self.isPressedRLong ? .green : .gray, sizeX: 300, sizeY: 280)
                }.contentShape(Circle()).offset(x: -20)
                
                Text("R").bold().offset(x:100, y:-40).font(.system(size:32))
                
                Button(action: {
                    withAnimation {self.isPressedQShort = true
                        self.isPressedQLong.toggle()
                    }
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {self.isPressedQShort = false}
                  }
                }){
                    EllipseView(color: self.isPressedQLong ? .green : .gray, sizeX: 250, sizeY: 250)
                }.contentShape(Circle()).offset(x: -40)
                
                Text("Q").bold().offset(x:65, y:-30).font(.system(size:32))
                
                Button(action: {
                    withAnimation {self.isPressedZShort = true
                        self.isPressedZLong.toggle()
                    }
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {self.isPressedZShort = false}
                  }
                }){
                    EllipseView(color: self.isPressedZLong ? .green : .gray, sizeX: 210, sizeY: 200)
                }.contentShape(Circle()).offset(x: -55)
                
                Text("Z").bold().offset(x:20, y:-20).font(.system(size:32))
                
                Button(action: {
                    withAnimation {self.isPressedNShort = true
                        self.isPressedNLong.toggle()
                    }
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {self.isPressedNShort = false}
                  }
                }) {
                    EllipseView(color: self.isPressedNLong ? .green : .gray, sizeX: 150, sizeY: 150)
                }.contentShape(Circle()).offset(x: -73)
                
                Text("N").bold().offset(x:-130, y:0).font(.system(size:32))
                
            }.padding(10)
            
            Spacer()
            
            NavigationLink(destination: Lesson0_4().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .bold().frame(width: 280, height: 50)
                    .background(Color.green).foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.offset(y: -90)
    }
}

struct Lesson0_4: View {
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("To show that an element is a member of the set we use a symbol ∈ ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Button(action: {
                withAnimation { self.isPressedShort = true
                    self.isPressedLong.toggle()
                }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {self.isPressedShort = false}
              }
            }){
                ZStack{
                    CircleView(color: self.isPressedLong ? .green : .gray, size: self.isPressedShort ? 250 : 200)
                    CircleView(color: .black, size: 10).offset(x:50, y:20)
                    CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                    CircleView(color: .black, size: 10).offset(x:-20, y:50)
                    Text("a").offset(x:60, y:30)
                    Text("b").offset(x:-50, y:-30)
                    Text("c").offset(x:-30, y:60)
                    Text("A").bold().offset(x:0, y:0).font(.system(size:32))
                }.padding(10)
            }
            
            Text("a,b,c ∈ A, but \n d ∉ A ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Spacer()
            
            NavigationLink(destination: Lesson0_5().navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .bold().frame(width: 280, height: 50)
                    .background(Color.green).foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.offset(y: -90)
    }
}

struct Lesson0_5: View {
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("To show that a set is a contained in another set (or equal to it) we use a symbol ⊆ ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Button(action: {
                withAnimation { self.isPressedShort = true
                    self.isPressedLong.toggle()
                }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {self.isPressedShort = false}
              }
            }){
                  ZStack{
                      CircleView(color: self.isPressedLong ? .green : .gray, size: self.isPressedShort ? 250 : 200)
                      CircleView(color: .black, size: 10).offset(x:50, y:20)
                      CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                      CircleView(color: .black, size: 10).offset(x:-20, y:50)
                      Text("a").offset(x:60, y:30)
                      Text("b").offset(x:-50, y:-30)
                      Text("c").offset(x:-30, y:60)
                      Text("A").bold().offset(x:0, y:0).font(.system(size:32))
                  }.padding(10)
                }
            
            Text("{a,b}, {a} ⊆ A, but \n a, {b,d} ⊄ A ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Spacer()
            
            NavigationLink(destination: Lesson0_6(quizManager: QuizManager()).navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!")
                    .bold().frame(width: 280, height: 50)
                    .background(Color.green).foregroundColor(.white)
                    .cornerRadius(10)
            })
        }.offset(y: -90)
    }
}

struct Lesson0_6: View {
    
    @ObservedObject var quizManager: QuizManager
    
    var body: some View {
        
        if (quizManager.model.quizCompleted){
            Lesson0_7()
        } else {
            VStack{
                
                Spacer()
                
                Text(quizManager.model.quizModel.question).foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
                
                QuizOptionGridView(quizManager: quizManager)
                
                Spacer()
                
            }.offset(y: -90)
        }
    }
}

import UIKit

struct Lesson0_7: View {
    
    @State private var isShaking = false
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(100), spacing: 0), count: 3)
    
    @State private var isPopUpVisible = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Correctly construct the set\n A = {{a}, b, {a, b}} \n By dragging the green elements into the gray set").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            Button(action: {
                withAnimation { self.isPressedShort = true
                    self.isPressedLong.toggle()
                }
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {self.isPressedShort = false}
              }
            }){
                  ZStack{
                      CircleView(color: .gray, size: self.isPressedShort ? 300 : 250)
                      Text("A").bold().offset(x:0, y:0).font(.system(size:32))
                  }.padding(20)
                }
            
            Spacer()
            
            LazyVGrid(columns: columns, alignment: .center) {
                DraggableCircleView(color: .green, size: 50, text: "a")
                DraggableCircleView(color: .green, size: 50, text: "b")
                DraggableCircleView(color: .green, size: 50, text: "{a}")
                DraggableCircleView(color: .green, size: 50, text: "{b}")
                DraggableCircleView(color: .green, size: 50, text: "{a, b}")
                DraggableCircleView(color: .green, size: 50, text: "A")
            }.padding(.leading, 100.0)
            
            Spacer()
            
            Button(action: { self.isPopUpVisible = true }){
                Text("Check!")
                    .bold().frame(width: 280, height: 50)
                    .background(Color.green).foregroundColor(.white)
                    .cornerRadius(10)
            }.sheet(isPresented: $isPopUpVisible) {
                Text("Incorrect!")
            }
            
            Spacer()
            
        }.offset(y: -90).padding(10)
        
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
//            Ellipse().border(.black).frame(width: sizeX, height: sizeY).foregroundColor(color)
        }
    }
}

struct Lesson0View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson0View(lessonId: 0, lessonManager: LessonManager())
    }
}
