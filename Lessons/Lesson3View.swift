//
//  Lesson3View.swift
//  firstTest
//
//  Created by Norbertas Blandis on 19/03/2023.
//

import SwiftUI

struct Lesson3View: View {
    
    var lessonId: Int
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        VStack{
//            Text("Welcome to "+lessonManager.model.lessonModel[lessonId].title+"!")
            Text("Welcome to the Theorems on Convergence lesson!")
                .modifier(BlackTitleTextStyle())
            
            NavigationLink(destination: LimitIntroductionView().navigationBarTitle("Limits").navigationBarHidden(false),label: {
                Text("Start the lesson!").modifier(GreenButtonWhiteTextStyle())})
        }.offset(y: -90)
    }
}

struct LimitIntroductionView: View {
    
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdef : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    
    var body: some View {
        VStack{
            VStack{
                
                //Limit introduction
                Spacer()
                Text("We know the definition of convergence and know how to prove a sequence is convergent 'from first principles'").multilineTextAlignment(.center).padding()
                HStack{
                    Text("Given a sequence")
                    TextView(string: $seqdef).frame(width: 75, height: 30.0)
                    Text(", if we can prove")}
                HStack{
                    Text("that it converges to")
                    TextView(string: $rvalue).frame(width: 45, height: 20)
                    Text("we often write:")}
                TextView(string: $limdef).frame(width: 180, height: 30.0)
                Text("Could you tell which of the following are correct?").bold().multilineTextAlignment(.center).padding()
                Spacer()
                NavigationLink(destination: UniqueLimitTheoremView().navigationBarTitle("Unique limits").navigationBarHidden(false),label: {
                    Text("Next!").modifier(GreenButtonWhiteTextStyle())})
                Spacer()
            }.modifier(BlackDetailedAcademicTextStyle())
        }.padding(10)
    }
}

struct UniqueLimitTheoremView: View{
    
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdefr : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    @State private var limdefs : String = "[math]$lim_{n→∞}a_{n}=s[/math]"
    @State private var conclus : String = "[math]r=s[/math]"

    var body: some View{
        VStack{
            Spacer()
            
            Text("Now we will prove a very important theorem in real analysis:").multilineTextAlignment(.center)
            //Theorem version 1
            VStack{
                HStack{
                    Text("Given a convergent sequence")
                    TextView(string: $seqdef).frame(width: 75, height: 30.0)}.padding(.top, 5)
                HStack{
                    Text("it converges to a")
                    Text("unique").bold()
                    TextView(string: $rvalue).frame(width: 53, height: 20)}.padding(.bottom, 5)
            }.modifier(GrayContainerStyle(opacity: 0.2)).modifier(BlackDetailedAcademicTextStyle())
            
            Text("Or equivalently...")
            
            //Theorem version 2
            VStack{
                HStack{
                    Text("Given a convergent sequence")
                    TextView(string: $seqdef).frame(width: 75, height: 30.0)}.padding(.top, 5)
                HStack{
                    Text("if ")
                    TextView(string: $limdefr).frame(width: 150, height: 30.0)}
                HStack{
                    Text("and")
                    TextView(string: $limdefs).frame(width: 150, height: 30.0)}
                HStack{
                    Text("then ")
                    TextView(string: $conclus).frame(width: 80, height: 12.0)}.padding(.bottom, 5)
            }.modifier(GrayContainerStyle(opacity: 0.2)).modifier(BlackDetailedAcademicTextStyle())
            Spacer()
            Text("Now for the proof:")
            NavigationLink(destination: UniqueLimitTheoremProofView().navigationBarTitle("Unique limits  proof").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            Spacer()
        }.padding(10)
    }
}

struct UniqueLimitTheoremProofView: View{
    
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdefr : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    @State private var limdefs : String = "[math]$lim_{n→∞}a_{n}=s[/math]"
    @State private var conclus : String = "[math]r=s[/math]"
    @State private var epsilonvalue: String = "[math]ε=(s-r)/2[/math]"
    @State private var finalassum: String = "[math](r+s)/2<a_{n}<(r+s)/2[/math]"
    @State private var difficulty: String? = nil
    
    @State private var step1pressed: Bool = false
    @State private var step2pressed: Bool = false
    @State private var step3pressed: Bool = false

    var body: some View{
        VStack{
            
            if difficulty == nil{Spacer()}
            //Theorem version 2
            VStack{
                HStack{
                    Text("Given a convergent sequence")
                    TextView(string: $seqdef).frame(width: 75, height: 30.0)}.padding(.top, 5)
                HStack{
                    Text("if ")
                    TextView(string: $limdefr).frame(width: 150, height: 30.0)}
                HStack{
                    Text("and")
                    TextView(string: $limdefs).frame(width: 150, height: 30.0)}
                HStack{
                    Text("then ")
                    TextView(string: $conclus).frame(width: 80, height: 12.0)}.padding(.bottom, 5)
            }.modifier(GrayContainerStyle(opacity: 0.2))
            
            //Select difficulty buttons
            if difficulty == nil{
                Text("Select the difficulty of the proof:").padding()
                Button(action: { withAnimation{self.difficulty = "easy" }}) {
                    HStack{
                        Text("Easy").bold().padding(.leading)
                        Text("(many hints)")
                            .padding([.top, .bottom, .trailing])
                    }.modifier(LightGreenButtonStyleFullFrame())}
                
                Button(action: { withAnimation{self.difficulty = "challenging" }}) {
                    HStack{
                        Text("Challenging").bold().padding(.leading)
                        Text("(some guidance)")
                            .padding([.top, .bottom, .trailing])
                    }.modifier(LightGreenButtonStyleFullFrame())}
                
            //Easy proof
            } else if difficulty == "easy"{
                
                Spacer()
                //Step 1 easy
                HStack{
                    Text("Step 1:").bold().padding(.leading)
                    Text("Selecting the type of proof")
                        .padding([.top, .bottom, .trailing])
                }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(UniqueLimitEasyProofExpl1())))
                
                //Step 2 easy
                HStack{
                    Text("Step 2:").bold().padding(.leading)
                    Text("Writing out the assumption")
                        .padding([.top, .bottom, .trailing])
                }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(UniqueLimitEasyProofExpl2())))
                
                //Step 3 easy
                HStack{
                    Text("Step 3:").bold().padding(.leading)
                    Text("Finding a contradiction")
                        .padding([.top, .bottom, .trailing])
                }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(UniqueLimitEasyProofExpl3())))
                
                //Step 4 easy
                HStack{
                    Text("Step 4:").bold().padding(.leading)
                    Text("Finishing the proof")
                        .padding([.top, .bottom, .trailing])
                }.modifier(NotPulsatingButtonCoverStyleFullFrame(explanationView: AnyView(UniqueLimitEasyProofExpl4())))
                
                Button("Back") {withAnimation {difficulty = nil}}
                
            //Challenging proof
            } else{
                
                Spacer()
                Text("Try writing the proof out on your using the app only for guidance!")
                //Step 1 challenging
                if !step1pressed{
                    Button(action: { withAnimation{step1pressed.toggle();step2pressed=false;step3pressed=false }}){
                        HStack{
                            Text("Step 1:").bold().padding(.leading)
                            Text("Selecting the type of proof")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(LightGreenButtonStyleFullFrame())}
                } else{
                    Button(action:{withAnimation{step1pressed=false}}){
                        VStack{
                            Text("Procceed with a proof of contradiction:").padding(.top, 10)
                            Text(" - Write out the negation of the theorem")
                            Text(" - Write out the limits in terms of the definition of convergence").padding(.bottom, 10)
                        }.modifier(LightGreenButtonStyleFullFrame())}
                }
                
                //Step 2 challenging
                if !step2pressed{
                    Button(action: { withAnimation{step2pressed.toggle();step1pressed=false;step3pressed=false }}){
                        HStack{
                            Text("Step 2:").bold().padding(.leading)
                            Text("Finding the contradiction")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(LightGreenButtonStyleFullFrame())}
                } else{
                    Button(action:{withAnimation{step2pressed=false}}){
                        VStack{
                            Text("To find the contradiction consider:").padding(.top, 10)
                            TextView(string: $epsilonvalue).frame(width: 140, height: 25.0)
                            Text("Plug it in the negation statement and try to find a contradiction").padding(.bottom, 10)
                        }.modifier(LightGreenButtonStyleFullFrame())}
                }
                
                //Step 3 challenging
                if !step3pressed{
                    Button(action: { withAnimation{step3pressed.toggle();step1pressed=false;step2pressed=false}}){
                        HStack{
                            Text("Step 3:").bold().padding(.leading)
                            Text("Finishing the proof")
                                .padding([.top, .bottom, .trailing])
                        }.modifier(LightGreenButtonStyleFullFrame())}
                } else{
                    Button(action:{withAnimation{step3pressed=false}}){
                        VStack{
                            Text("In the end you should get the contradiction:").padding(.top, 10)
                            TextView(string: $finalassum).frame(width: 250, height: 30)
                            Text("Which proves the theorem is correct!").padding(.bottom, 10)
                        }.modifier(LightGreenButtonStyleFullFrame())}
                }
                
                Button("Back") {withAnimation {difficulty = nil}}
            }
            Spacer()
            
            NavigationLink(destination: Lesson3Complete(lessonManager: LessonManager()).navigationBarTitle("").navigationBarHidden(false),label: {
                Text("Next!").modifier(GreenButtonWhiteTextStyle())})
            
        }.padding(10).modifier(BlackDetailedAcademicTextStyle())
    }
}

struct Lesson3Complete: View {
    
    @ObservedObject var lessonManager: LessonManager
    @State private var isPressed: Bool = false
    
    var body: some View{
        
        VStack{
            Spacer()
            Text("Congratulations! You have completed the theorems on Convergence lesson!").modifier(BlackTitleTextStyle())
            Spacer()
            
            NavigationLink(destination: LessonSelectView(lessonManager: LessonManager(), isCompleted: true, completedLessonId: 2, unlockedLessonId: 3).navigationBarTitle("").navigationBarHidden(true),label: {
                Text("Great!").modifier(GreenButtonWhiteTextStyle())
            })
        }.offset(y: -90).padding(20)
    }
}


struct Lesson3View_Previews: PreviewProvider {
    static var previews: some View {
        UniqueLimitTheoremProofView()
    }
}
