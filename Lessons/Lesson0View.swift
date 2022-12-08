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
    
    var body: some View {
        VStack{
            Spacer()
            Text("A set is just a collection of items.\nFor example: A = {a, b, c} is a set with elements a, b, c. ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 24)).multilineTextAlignment(.center).padding()
            ZStack{
                CircleView(color: .gray, size: 200)
                CircleView(color: .black, size: 10).offset(x:50, y:20)
                CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                CircleView(color: .black, size: 10).offset(x:-20, y:50)
                Text("a").offset(x:60, y:30)
                Text("b").offset(x:-50, y:-30)
                Text("c").offset(x:-30, y:60)
                Text("A").bold().offset(x:0, y:0).font(.system(size:32))
            }.padding(10)
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

    var body: some View {
        VStack{
            Spacer()
            Text("Elements of a set can be anything: points in space, numbers, fruits, sets, ...\n For example:").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            ZStack{
                CircleView(color: .gray, size: 200)
                Text("{a, b}").bold().offset(x:60, y:30)
                Text("Banana").bold().offset(x:-40, y:-50)
                Text("1000").bold().offset(x:-30, y:60)
                Image(systemName: "gamecontroller").resizable().frame(width: 30, height: 20).offset(x:50, y:-50)
                Text("B").bold().offset(x:0, y:0).font(.system(size:32))
            }.padding(10)
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

    var body: some View {
        VStack{
            
            Spacer()
            
            Text("You have probably already come across some sets in the past: C, R, Q, Z, N").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            ZStack{
                Button(action: {}){
                    EllipseView(color: .gray, sizeX: 350, sizeY: 300)
                }.contentShape(Circle())
                Text("C").bold().offset(x:150, y:-50).font(.system(size:32))
                Button(action: {}){
                    EllipseView(color: .gray, sizeX: 300, sizeY: 280)
                }.contentShape(Circle()).offset(x: -20)
                Text("R").bold().offset(x:100, y:-40).font(.system(size:32))
                Button(action: {}){
                    EllipseView(color: .gray, sizeX: 250, sizeY: 250)
                }.contentShape(Circle()).offset(x: -40)
                Text("Q").bold().offset(x:65, y:-30).font(.system(size:32))
                Button(action: {}){
                    EllipseView(color: .gray, sizeX: 210, sizeY: 200)
                }.contentShape(Circle()).offset(x: -55)
                Text("Z").bold().offset(x:20, y:-20).font(.system(size:32))
                Button(action: {}){
                    EllipseView(color: .gray, sizeX: 150, sizeY: 150)
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
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("To show that an element is a member of the set we use a symbol ∈ ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            ZStack{
                CircleView(color: .gray, size: 200)
                CircleView(color: .black, size: 10).offset(x:50, y:20)
                CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                CircleView(color: .black, size: 10).offset(x:-20, y:50)
                Text("a").offset(x:60, y:30)
                Text("b").offset(x:-50, y:-30)
                Text("c").offset(x:-30, y:60)
                Text("A").bold().offset(x:0, y:0).font(.system(size:32))
            }.padding(10)
            
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
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("To show that a set is a contained in another set (or equal to it) we use a symbol ⊆ ").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
            ZStack{
                CircleView(color: .gray, size: 200)
                CircleView(color: .black, size: 10).offset(x:50, y:20)
                CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                CircleView(color: .black, size: 10).offset(x:-20, y:50)
                Text("a").offset(x:60, y:30)
                Text("b").offset(x:-50, y:-30)
                Text("c").offset(x:-30, y:60)
                Text("A").bold().offset(x:0, y:0).font(.system(size:32))
            }.padding(10)
            
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
//            QuizCompletedView(quizManager: quizManager)
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

struct Lesson0_7: View {
    
    var body: some View {
        
        VStack{
            
            Text("Lesson about Quantifiers!").foregroundColor(Color.black).font(.custom("AmericanTypewriter", fixedSize: 23)).multilineTextAlignment(.center).padding()
            
        }.offset(y: -90)
        
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

struct EllipseView: View {
    
    var color: Color
    var sizeX: CGFloat
    var sizeY: CGFloat
    
    var body: some View {
        ZStack{
            Ellipse()
                .strokeBorder(.black, lineWidth: 1)
                .background(Ellipse().fill(.gray))
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
