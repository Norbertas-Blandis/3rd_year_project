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
    
    var body: some View {
        VStack{
            Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
                .modifier(BlackTitleTextStyle())
            
            NavigationLink(destination: Lesson0_1().navigationBarTitle("Sets").navigationBarHidden(false), label: {
                Text("Start the lesson!")
                .modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90)
    }
}

struct Lesson0_1: View {

    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var body: some View {
        VStack{
            
            Spacer()
            Text("A set is just a collection of items.\nFor example: A = {a, b, c} is a set with elements a, b, c. ")
            
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
            
            NavigationLink(destination: Lesson0_2().navigationBarTitle("Sets").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).modifier(BlackTitleAcademicTextStyle())
    }
}

struct Lesson0_2: View {
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false

    var body: some View {
        VStack{
            
            Spacer()
            
            Text("Elements of a set can be anything: points in space, numbers, fruits, sets, ...\n For example:")
            
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
            
            Text("B = { {a,b}, Banana, 1000, \(Image(systemName: "gamecontroller")) } ")
            
            Spacer()
            
            NavigationLink(destination: Lesson0_3().navigationBarTitle("Sets").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).modifier(BlackTitleAcademicTextStyle())
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
            
            Text("You have probably already come across some sets in the past: C, R, Q, Z, N")
            
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
                
                Text("ℂ").bold().offset(x:150, y:-50).font(.system(size:32))
                
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
                
                Text("ℝ").bold().offset(x:100, y:-40).font(.system(size:32))
                
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
                
                Text("ℚ").bold().offset(x:65, y:-30).font(.system(size:32))
                
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
                
                Text("ℤ").bold().offset(x:20, y:-20).font(.system(size:32))
                
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
                
                Text("ℕ").bold().offset(x:-130, y:0).font(.system(size:32))
                
            }.padding(10)
            
            Spacer()
            
            NavigationLink(destination: Lesson0_4().navigationBarTitle("Sets").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).modifier(BlackTitleAcademicTextStyle())
    }
}

struct Lesson0_4: View {
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("To show that an element is a member of the set we use a symbol ∈ ")
            
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
            
            Text("a,b,c ∈ A, but \n d ∉ A ")
            
            Spacer()
            
            NavigationLink(destination: Lesson0_5().navigationBarTitle("Sets").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).modifier(BlackTitleAcademicTextStyle())
    }
}

struct Lesson0_5: View {
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("To show that a set is a contained in another set (or equal to it) we use a symbol ⊆ ")
            
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
            
            Text("{a,b}, {a} ⊆ A, but \n a, {b,d} ⊄ A ")
            
            Spacer()
            
            NavigationLink(destination: Lesson0_6(goNext: true).navigationBarTitle("Practice sets").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            
        }.offset(y: -90).modifier(BlackTitleAcademicTextStyle())
    }
}

struct Lesson0_6: View {
    
    var goNext: Bool
    
    @State private var option1: String = "[math]a ∈ A[/math]"
    @State private var option2: String = "[math]a ∉ A[/math]"
    @State private var option3: String = "[math]a ⊆ A[/math]"
    @State private var option4: String = "[math]A ⊆ a[/math]"
    
    @State private var isPressedShort = false
    @State private var isPressedLong = false
    @State private var showNextQuestion = false
    
    var body: some View {
        
        VStack{
            
            VStack{
                //Question
                Text("Which statement about the set A = {a, b, c} is correct?").multilineTextAlignment(.center).padding(.top)
                //Set
                Button(action: {
                    withAnimation { self.isPressedShort = true
                        self.isPressedLong.toggle()
                    }
                  DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {self.isPressedShort = false}
                  }
                }){
                      ZStack{
                          CircleView(color: self.isPressedLong ? .green : .gray.opacity(0.8), size: self.isPressedShort ? 250 : 200)
                          CircleView(color: .black, size: 10).offset(x:50, y:20)
                          CircleView(color: .black, size: 10).offset(x:-40, y:-40)
                          CircleView(color: .black, size: 10).offset(x:-20, y:50)
                          Text("a").offset(x:60, y:30).foregroundColor(Color.black)
                          Text("b").offset(x:-50, y:-30).foregroundColor(Color.black)
                          Text("c").offset(x:-30, y:60).foregroundColor(Color.black)
                          Text("A").bold().offset(x:0, y:0).font(.system(size:32)).foregroundColor(Color.black)
                      }.padding(10)
                    }
            }.modifier(GrayContainerStyle(opacity: 0.2)).padding(.bottom)
            
            if !showNextQuestion{
                MultipleQuestionView(
                    optionA: TextView(string: $option1).frame(width: 100, height: 20.0),
                    optionB: TextView(string: $option2).frame(width: 100, height: 20.0),
                    optionC: TextView(string: $option3).frame(width: 100, height: 20.0),
                    optionD: TextView(string: $option4).frame(width: 100, height: 20.0),
                    correctAnswerIndex: 0, alignment: "h",
                    showNextQuestion: $showNextQuestion
                )
            } else {
                Text("Correct!").foregroundColor(Color.green)
                if goNext{
                    NavigationLink(destination: Lesson0_7(goNext: true).navigationBarTitle("Practice sets").navigationBarHidden(false),label: {
                        Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                }
            }
            
            Spacer()
            
        }.modifier(BlackTitleAcademicTextStyle())
    }
}

struct Lesson0_7: View {
    
    var goNext: Bool
    
    @State private var option1: String = "[math]ℕ ⊆ ℝ[/math]"
    @State private var option2: String = "[math]ℚ ⊆ ℝ[/math]"
    @State private var option3: String = "[math]ℝ ⊆ ℂ[/math]"
    @State private var option4: String = "[math]ℤ ⊆ ℕ[/math]"
    
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
    
    @State private var showNextQuestion = false
    
    var body: some View {
        
        VStack{
            
            VStack{
                //Question
                Text("Which statement about the following sets is incorrect?").multilineTextAlignment(.center).padding(.top)
                
                //Set
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
                    
                    Text("ℂ").bold().offset(x:150, y:-50).font(.system(size:32))
                    
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
                    
                    Text("ℝ").bold().offset(x:100, y:-40).font(.system(size:32))
                    
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
                    
                    Text("ℚ").bold().offset(x:65, y:-30).font(.system(size:32))
                    
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
                    
                    Text("ℤ").bold().offset(x:20, y:-20).font(.system(size:32))
                    
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
                    
                    Text("ℕ").bold().offset(x:-130, y:0).font(.system(size:32))
                    
                }.padding(10)
            }.modifier(GrayContainerStyle(opacity: 0.2)).padding(.bottom)
            
            if !showNextQuestion{
                MultipleQuestionView(
                    optionA: TextView(string: $option1).frame(width: 100, height: 20.0),
                    optionB: TextView(string: $option2).frame(width: 100, height: 20.0),
                    optionC: TextView(string: $option3).frame(width: 100, height: 20.0),
                    optionD: TextView(string: $option4).frame(width: 100, height: 20.0),
                    correctAnswerIndex: 3, alignment: "h",
                    showNextQuestion: $showNextQuestion
                )
            } else {
                Text("Correct!").foregroundColor(Color.green)
                if goNext{
                    NavigationLink(destination: Lesson0_8().navigationBarTitle("Quantifiers").navigationBarHidden(false),label: {
                        Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                }
            }
            
        }.modifier(BlackTitleAcademicTextStyle())
    }
}

struct Lesson0_8: View {
    
    @State private var thereis: String = "[math]∃x∈A,p(x)[/math]"
    @State private var thereisstat: String = "[math]∃x∈ℕ,x<3[/math]"
    @State private var forall: String = "[math]∀x∈A,p(x)[/math]"
    @State private var forallstat: String = "[math]∀x∈ℕ,x<3[/math]"
    
    @State private var showFirst: Int = 0
    
    var body: some View{
        
        VStack{
            Spacer()
            Text("To make more sophisticated statements about sets, we shall use Quantifiers:").multilineTextAlignment(.center).padding()
            
            VStack{
                if showFirst < 2{
                    HStack{
                        Text("∃").font(.system(size: 24))
                        Text(" - 'there exists'").bold().padding(.top, 5)}
                    Text("For a statement p(x) and set A we write")
                    HStack{
                        TextView(string: $thereis).frame(width: 120, height: 30.0)
                        Text("to mean:")}
                    Text("'There exists x in A, such that the statement p(x) is true'").padding([.leading, .trailing, .bottom])
                } else{
                    HStack{
                        Text("∀").font(.system(size: 24))
                        Text("- 'for all'").bold().padding(.top, 5)}
                    Text("For a statement p(x) and set A we write")
                    HStack{
                        TextView(string: $forall).frame(width: 120, height: 30.0)
                        Text("to mean:")}
                    Text("'For all x in A, the statement p(x) is true'").padding([.leading, .trailing, .bottom])
                }

            }.modifier(GrayContainerStyle(opacity: 0.2))
            
            //Examples
            if showFirst == 1{
                VStack{
                    Text("For example, a statement:").padding(.top)
                    HStack{
                        TextView(string: $thereisstat).frame(width: 140, height: 30.0)
                        Text("means")}
                    Text("'There exists a Natural number x, such that x < 3'").padding([.leading, .trailing])
                    Text("which is true, since for example 1<3").padding([.leading, .trailing, .bottom])
                }.modifier(GrayContainerStyle(opacity: 0.1))
            }
            if showFirst > 2{
                VStack{
                    Text("For example, a statement:").padding(.top)
                    HStack{
                        TextView(string: $forallstat).frame(width: 140, height: 30.0)
                        Text("means")}
                    Text("'For all Natural numbers x, we have x < 3'").padding([.leading, .trailing])
                    Text("which is false, since for example 4>3").padding([.leading, .trailing, .bottom])
                }.modifier(GrayContainerStyle(opacity: 0.1))
            }
            
            if showFirst < 4{
                Button(action: { withAnimation{showFirst += 1 }}) {
                    HStack{
                        Text("Understood!").bold().padding()
                    }.modifier(LightGreenButtonStyleFullFrame())}
                Spacer()
            } else {
                NavigationLink(destination: Lesson0_9(goNext: true).navigationBarTitle("Quantifiers practise").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                Spacer()
            }
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0_9: View {
    
    var goNext: Bool
    
    @State private var thereisstat: String = "[math]∃x∈ℤ,x>10[/math]"
    @State private var thereisstat2: String = "[math]∃x∈ℝ,x^2=-1[/math]"
    @State private var thereisstat3: String = "[math]∃x∈ℂ,x^2=-1[/math]"
    
    @State private var option1: String = "[math]∃x∈ℤ,x=0.5[/math]"
    @State private var option2: String = "[math]∀x∈ℤ,x^2>4[/math]"
    @State private var option3: String = "[math]∃x∈ℝ,x^2=-4[/math]"
    @State private var option4: String = "[math]∀x∈ℝ,x^2>-1[/math]"
    
    @State private var showSecond: Bool = false
    @State private var showThird: Bool = false
    @State private var showFourth: Bool = false
    @State private var showFifth: Bool = false
    @State private var showNext: Bool = false
    
    var body: some View{
        
        VStack{
            Spacer()
            
            VStack{
                if !showSecond{
                    Text("is the following statement correct?").multilineTextAlignment(.center).padding()
                    TextView(string: $thereisstat).frame(width: 140, height: 30.0)
                    QuestionView(question: "", correctAnswer: "Yes", incorrectAnswer: "No", showNextQuestion: $showSecond, comesFirst: 0).padding()
                } else if !showThird{
                    Text("is the following statement correct?").multilineTextAlignment(.center).padding()
                    TextView(string: $thereisstat2).frame(width: 160, height: 30.0)
                    QuestionView(question: "", correctAnswer: "No", incorrectAnswer: "Yes", showNextQuestion: $showThird, comesFirst: 1).padding(.bottom)
                } else if !showFourth{
                    Text("is the following statement correct?").multilineTextAlignment(.center).padding()
                    TextView(string: $thereisstat3).frame(width: 160, height: 30.0)
                    QuestionView(question: "", correctAnswer: "Yes", incorrectAnswer: "No", showNextQuestion: $showFourth, comesFirst: 0).padding()
                } else if !showFifth{
                    Text("Which of the statements is correct?").padding()
                    MultipleQuestionView(
                        optionA: TextView(string: $option1).frame(width: 170, height: 25.0),
                        optionB: TextView(string: $option2).frame(width: 170, height: 25.0),
                        optionC: TextView(string: $option3).frame(width: 170, height: 25.0),
                        optionD: TextView(string: $option4).frame(width: 170, height: 25.0),
                        correctAnswerIndex: 3, alignment: "v",
                        showNextQuestion: $showNext
                    )
                }
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            if showNext{
                if goNext{
                    NavigationLink(destination: Lesson0_10().navigationBarTitle("Functions").navigationBarHidden(false),label: {
                        Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                }
            }
            Spacer()
            
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0_10: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var f : String = "[math]f[/math]"
    @State private var functionass : String = "[math]f(a)=1,f(b)=2,f(c)=3[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    var body: some View {
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
            NavigationLink(destination: Lesson0_11().navigationBarTitle("Functions").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            Spacer()
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0_11: View {
    
    @State private var functionexam : String = "[math]f(x)=x^2[/math]"
    @State private var functiondef : String = "[math]f:ℝ → ℝ[/math]"
    @State private var f : String = "[math]f[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    var body: some View {
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
            NavigationLink(destination: Lesson0_12().navigationBarTitle("Continuity intuition").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            Spacer()
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0_12: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var f : String = "[math]f[/math]"
    @State private var functionass : String = "[math]f(1)=2,f(2)=1,f(c)=3[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    var body: some View {
        VStack{
            
            //Function introduction
            Spacer()
            Text("Given two sets A and B, we can define a function").multilineTextAlignment(.center).padding()
            TextView(string: $functiondef).frame(width: 130, height: 30.0)
            Text("Notice that it is very important that the")
            HStack{
                Text("function assigns")
                Text("Every element of A").bold()}
            Text("To an element in B.")
            
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
                            Text("1").offset(x:60, y:30)
                            Text("2").offset(x:-50, y:-30)
                            Text("3").offset(x:-30, y:60)
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
                            Text("A").bold().offset(x:0, y:0).font(.system(size:32))
                        }.padding(10)
                    }
                }
                TextView(string: $functionass).frame(width: 180, height: 30.0)
                Text("This is not a function as f(3) is not defined, so no every element of A is assigned to a value in B").italic().padding()
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            Spacer()
            NavigationLink(destination: Lesson0_13().navigationBarTitle("Functions").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            Spacer()
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0_13: View {
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var f : String = "[math]f[/math]"
    @State private var functionass : String = "[math]f(1)=a,f(1)=b,f(2=b),f(3)=c[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    var body: some View {
        VStack{
            
            //Function introduction
            Spacer()
            Text("Also, function has to assign each element of")
            HStack{
                Text("A to a")
                Text("unique element of B").bold()}
            
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
                            Text("1").offset(x:60, y:30)
                            Text("2").offset(x:-50, y:-30)
                            Text("3").offset(x:-30, y:60)
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
                            Text("a").offset(x:60, y:30)
                            Text("b").offset(x:-50, y:-30)
                            Text("10").offset(x:-30, y:60)
                            Text("B").bold().offset(x:0, y:0).font(.system(size:32))
                        }.padding(10)
                    }
                }
                TextView(string: $functionass).frame(width: 350, height: 30.0)
                Text("This is not a function as f(1) is assigned to both a and b, so 1 is not assigned to a unique element in B").italic().padding()
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            Spacer()
            NavigationLink(destination: Lesson0_14(goNext: true).navigationBarTitle("Functions").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            Spacer()
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0_14: View {
    
    var goNext: Bool
    
    @State private var functiondef : String = "[math]f:A → B[/math]"
    @State private var f : String = "[math]f[/math]"
    @State private var functionass : String = "[math]f(1)=a,f(2)=a,f(3)=a[/math]"
    @State private var functionass2 : String = "[math]f(1)=a,f(2)=b[/math]"
    
    @State private var thereisstat: String = "[math]∃x∈ℤ,x>10[/math]"
    @State private var thereisstat2: String = "[math]∃x∈ℝ,x^2=-1[/math]"
    @State private var thereisstat3: String = "[math]∃x∈ℂ,x^2=-1[/math]"
    
    @State private var option1: String = "[math]f(1)=a,f(2)=a,f(3)=a[/math]"
    @State private var option2: String = "[math]f(1)=a,f(2)=a,f(3)=b[/math]"
    @State private var option3: String = "[math]f(1)=a,f(2)=b,f(3)=c[/math]"
    @State private var option4: String = "[math]f(1)=a,f(1)=b,f(3)=a[/math]"
    
    @State private var isPressedShortA = false
    @State private var isPressedLongA = false
    @State private var isPressedShortB = false
    @State private var isPressedLongB = false
    
    @State private var showSecond: Bool = false
    @State private var showThird: Bool = false
    @State private var showFourth: Bool = false
    @State private var showFifth: Bool = false
    
    var body: some View{
        
        VStack{
            Spacer()
            
            VStack{
                
                //Set function visual
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
                            Text("1").offset(x:60, y:30)
                            Text("2").offset(x:-50, y:-30)
                            Text("3").offset(x:-30, y:60)
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
                            Text("a").offset(x:60, y:30)
                            Text("b").offset(x:-50, y:-30)
                            Text("c").offset(x:-30, y:60)
                            Text("B").bold().offset(x:0, y:0).font(.system(size:32))
                        }.padding(10)
                    }
                }
                
                //Question 1
                if !showSecond{
                    TextView(string: $functionass).frame(width: 280, height: 30.0)
                    Text("is this a function?").multilineTextAlignment(.center)
                    QuestionView(question: "", correctAnswer: "Yes", incorrectAnswer: "No", showNextQuestion: $showSecond, comesFirst: 0).padding()
                // Question 2
                } else if !showThird{
                    TextView(string: $functionass2).frame(width: 200, height: 30.0)
                    Text("is this a function?").multilineTextAlignment(.center).padding()
                    QuestionView(question: "", correctAnswer: "No", incorrectAnswer: "Yes", showNextQuestion: $showThird, comesFirst: 1).padding()
                } else if !showFourth{
                    Text("Which assignment DOES NOT give us a function?").padding()
                    MultipleQuestionView(
                        optionA: TextView(string: $option1).frame(width: 280, height: 25.0),
                        optionB: TextView(string: $option2).frame(width: 280, height: 25.0),
                        optionC: TextView(string: $option3).frame(width: 280, height: 25.0),
                        optionD: TextView(string: $option4).frame(width: 280, height: 25.0),
                        correctAnswerIndex: 3, alignment: "v",
                        showNextQuestion: $showFifth
                    )
                }
            }.modifier(GrayContainerStyle(opacity: 0.1))
            
            if showFifth{
                if goNext{
                    NavigationLink(destination: Lesson0Complete(lessonManager: LessonManager()).navigationBarTitle("Functions").navigationBarHidden(false),label: {
                        Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                }
            }
            
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson0Complete: View {
    
    @ObservedObject var lessonManager: LessonManager
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var isPressed: Bool = false
    
    var body: some View{
        
        VStack{
            Spacer()
            Text("Congratulations! You have completed Prerequisites!").modifier(BlackTitleTextStyle())
            Spacer()
            
            NavigationLink(destination: LessonSelectView(lessonManager: LessonManager(), isCompleted: true, completedLessonId: 0, unlockedLessonId: 1).navigationBarTitle("").navigationBarHidden(true),label: {
                Text("Great!").modifier(GreenButtonWhiteTextStyle())
            })

            
        }.offset(y: -90)
    }
}

struct Lesson0View_Previews: PreviewProvider {
    static var previews: some View {
        Lesson0_12()
    }
}

