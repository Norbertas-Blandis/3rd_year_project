//
//  UniqueLimitEasyProofExpl1.swift
//  firstTest
//
//  Created by Norbertas Blandis on 19/03/2023.
//

import SwiftUI

struct UniqueLimitEasyProofExpl1: View {
    
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdefr : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    @State private var limdefs : String = "[math]$lim_{n→∞}a_{n}=s[/math]"
    @State private var conclus : String = "[math]r=s[/math]"
    @State private var badconclus : String = "[math]r≠s[/math]"
    
    @State private var answer1: String = "[math]p and q ⇒ r[/math]"
    @State private var answer2: String = "[math]p and q and ¬r[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showAnswer: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("We will do a proof by contradiction - \nAssume the theorem is wrong and arrive at a false statement, proving that the theorem is actually correct.").padding(10)
            VStack{
                HStack{
                    Text("'if ")
                    TextView(string: $limdefr).frame(width: 150, height: 30.0)}
                HStack{
                    Text("and")
                    TextView(string: $limdefs).frame(width: 150, height: 30.0)}
                HStack{
                    Text("then ")
                    TextView(string: $conclus).frame(width: 55, height: 12.0)
                    Text("'")}.padding(.bottom, 5)
            }.modifier(GrayContainerStyle(opacity: 0.2))
            
            Text("Can you write out the negation of this theorem?").bold().padding()
            
            //Numerical explanation
            if showNumerical{
                VStack{
                    Text("The logical negation of a statement:").padding(.top, 10)
                    TextView(string: $answer1).frame(width: 150.0, height: 30.0)
                    Text("is the statement:")
                    TextView(string: $answer2).frame(width: 170.0, height: 30.0).padding(.top, 10)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            //Numerical explanation
            if showAnswer{
                VStack{
                    HStack{
                        TextView(string: $limdefr).frame(width: 150.0, height: 30.0)
                        Text("and")}
                    HStack{
                        TextView(string: $limdefs).frame(width: 170.0, height: 30.0)
                        Text("and")}
                    TextView(string: $badconclus).frame(width: 80, height: 30.0).padding(.top, 10)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }
            
            Spacer()
            
            //Help and Reveal answer buttons
            HStack{
                Button(action: {showNumerical.toggle(); showAnswer=false}, label: {
                    Text("Hint").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
                Spacer()
                Button(action: {showAnswer.toggle(); showNumerical=false}, label: {
                    Text("Show answer").modifier(GreenHelpButtonStyle(isActivated: showAnswer))})
             }
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct UniqueLimitEasyProofExpl2: View {
    
    @State private var convergencedef: String = "[math]∀ε>0,∃N_{1}∈ℕ,∀n≥N_{1} |a_{n}−r|<ε[/math]"
    @State private var convergencedefs: String = "[math]∀ε>0,∃N_{2}∈ℕ,∀n≥N_{2} |a_{n}−s|<ε[/math]"
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdefr : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    @State private var limdefs : String = "[math]$lim_{n→∞}a_{n}=s[/math]"
    @State private var conclus : String = "[math]r=s[/math]"
    @State private var badconclus : String = "[math]r≠s[/math]"
    
    @State private var answer1: String = "[math]p and q ⇒ r[/math]"
    @State private var answer2: String = "[math]p and q and ¬r[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showAnswer: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Towards contradiction, we assume:").padding(10)
            VStack{
                HStack{
                    TextView(string: $limdefr).frame(width: 150.0, height: 30.0)
                    Text("and")}
                HStack{
                    TextView(string: $limdefs).frame(width: 170.0, height: 30.0)
                    Text("and")}
                TextView(string: $badconclus).frame(width: 80, height: 30.0).padding(.top, 10)
            }.frame(maxWidth: .infinity).modifier(GrayContainerStyle(opacity: 0.2))
            
            Text("Can you write out this assumption with the full definitions of these limits?").bold().padding()

            //Numerical explanation
            if showNumerical{
                VStack{
                    HStack{
                        Text("Given a convergent sequence")
                        TextView(string: $seqdef).frame(width: 75, height: 30.0)}.padding(.top, 5)
                    HStack{
                        Text("by")
                        TextView(string: $limdefr).frame(width: 150, height: 30.0)
                        Text(" we mean:")}
                    TextView(string: $convergencedef).frame(width: 365, height: 30.0).padding(.bottom, 5)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }

            //Show Answer
            if showAnswer{
                VStack{
                    TextView(string: $convergencedef).frame(width: 365, height: 30.0).padding(.top, 10)
                    Text("and")
                    TextView(string: $convergencedefs).frame(width: 365, height: 30.0)
                    Text("and")
                    TextView(string: $badconclus).frame(width: 50, height: 30.0).padding(.bottom, 10)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }

            Spacer()

            //Help and Reveal answer buttons
            HStack{
                Button(action: {showNumerical.toggle(); showAnswer=false}, label: {
                    Text("Hint").modifier(GreenHelpButtonStyle(isActivated: showNumerical))})
                Spacer()
                Button(action: {showAnswer.toggle(); showNumerical=false}, label: {
                    Text("Show answer").modifier(GreenHelpButtonStyle(isActivated: showAnswer))})
             }
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct UniqueLimitEasyProofExpl3: View {
    
    @State private var convergencedef: String = "[math]∀ε>0,∃N_{1}∈ℕ,∀n≥N_{1} |a_{n}−r|<ε[/math]"
    @State private var convergencedefs: String = "[math]∀ε>0,∃N_{2}∈ℕ,∀n≥N_{2} |a_{n}−s|<ε[/math]"
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdefr : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    @State private var limdefs : String = "[math]$lim_{n→∞}a_{n}=s[/math]"
    @State private var conclus : String = "[math]r=s[/math]"
    @State private var badconclus : String = "[math]r≠s[/math]"
    
    @State private var answer1: String = "[math]p and q ⇒ r[/math]"
    @State private var answer2: String = "[math]p and q and ¬r[/math]"
    
    @State private var epsilonvalue: String = "[math]ε=(s-r)/2[/math]"
    @State private var firstassum: String = "[math]∃N_{1}∈ℕ,∀n≥N_{1} |a_{n}−r|<ε[/math]"
    @State private var secondassum: String = "[math]∃N_{2}∈ℕ,∀n≥N_{2} |a_{n}−s|<ε[/math]"
    @State private var firstassum2: String = "[math]∀n≥N_{1} r-ε<a_{n}<r+ε[/math]"
    @State private var secondassum2: String = "[math]∀n≥N_{2} s-ε<a_{n}<s+ε[/math]"
    
    @State private var foralln: String = "[math]∀n≥N_{2},N_{1}[/math]"
    @State private var firstassum3: String = "[math]r-(s-r)/2<a_{n}<r+(s-r)/2[/math]"
    @State private var secondassum3: String = "[math]s-(s-r)/2<a_{n}<s+(s-r)/2[/math]"
    @State private var firstassum4: String = "[math](3r-s)/2<a_{n}<(r+s)/2[/math]"
    @State private var secondassum4: String = "[math](r+s)/2<a_{n}<(3s-r)/2[/math]"
    @State private var finalassum: String = "[math](r+s)/2<a_{n}<(r+s)/2[/math]"
    
    @State private var showHintCount: Int = 0
    
    var body: some View {
        
        VStack{
            
            if showHintCount==0{
                Spacer()
            }
            
            Text("The key of this proof is to find such value of ε, that we will arrive at a contradiction").padding(10)
            
            VStack{
                TextView(string: $convergencedef).frame(width: 365, height: 30.0).padding(.top, 10)
                Text("and")
                TextView(string: $convergencedefs).frame(width: 365, height: 30.0)
                Text("and")
                TextView(string: $badconclus).frame(width: 50, height: 30.0).padding(.bottom, 10)
            }.frame(maxWidth: .infinity).modifier(GrayContainerStyle(opacity: 0.2))
            
            Text("Can you find a value for ε, such that we arrive at a contradiction?").bold().padding()

            //Hint 1
            if showHintCount==1{
                let maxWidth = UIScreen.main.bounds.width * 0.8
                VStack{
                    Text("Notice what happens when you set the value").padding(.top, 10)
                    TextView(string: $epsilonvalue).frame(width: 140, height: 25.0)
                    LineWithSliderTwoPointsEpsilon(pointsCount: 0, labels: [], labelViews: [], rvalue: 0.33, svalue: 0.66, maxWidth: maxWidth) { i, pointsCount in
                        let x = Double(1 - 1/Double(i+1)) * maxWidth
                        let y = 35.0
                        return CGPoint(x: x, y: y)}
                }.modifier(LightGreenContainerStyle())
            }
            
            //Hint 2
            if showHintCount==2{
                VStack{
                    HStack{
                        Text("Let")
                        TextView(string: $epsilonvalue).frame(width: 140, height: 30.0)
                    }.padding(.top, 10)
                    Text("then by our assumption:")
                    HStack{
                        TextView(string: $firstassum).frame(width: 280, height: 30.0)
                        Text("and")}
                    TextView(string: $secondassum).frame(width: 280, height: 30.0)
                    Text("or simplified")
                    TextView(string: $firstassum2).frame(width: 300, height: 30.0)
                    TextView(string: $secondassum2).frame(width: 300, height: 30.0)
                    Text("Plug in the value of ε and see what happens").padding(.bottom, 10)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }

            //Show Answer
            if showHintCount>2{
                VStack{
                    HStack{
                        Text("We must get that")
                        TextView(string: $foralln).frame(width: 130, height: 25.0)
                    }.padding(.top, 10)
                    TextView(string: $firstassum3).frame(width: 360, height: 30.0)
                    TextView(string: $secondassum3).frame(width: 360, height: 30.0)
                    Text("or simplified")
                    TextView(string: $firstassum4).frame(width: 300, height: 30.0)
                    TextView(string: $secondassum4).frame(width: 300, height: 30.0)
                    Text("but the we get")
                    TextView(string: $finalassum).frame(width: 300, height: 30.0)
                    Text("which is a contradiction").padding(.bottom, 10)
                }.frame(maxWidth: .infinity).modifier(LightGreenContainerStyle())
            }

            Spacer()

            //Help and Reveal answer buttons
            HStack{
                Spacer()
                if showHintCount==0{
                    Button(action: {showHintCount=showHintCount+1}, label: {
                        Text("Hint #1").modifier(GreenHelpButtonStyle(isActivated: true))})
                } else if showHintCount==1{
                    Button(action: {showHintCount=showHintCount+1}, label: {
                        Text("Hint #2").modifier(GreenHelpButtonStyle(isActivated: true))})
                } else{
                    Button(action: {showHintCount=showHintCount+1}, label: {
                        Text("Show answer").modifier(GreenHelpButtonStyle(isActivated: true))})
                }
                Spacer()
             }
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct UniqueLimitEasyProofExpl4: View {
    
    @State private var seqdef : String = "[math](a_{n})_{n∈ℕ}[/math]"
    @State private var rvalue : String = "[math]r∈ℝ[/math]"
    @State private var limdefr : String = "[math]$lim_{n→∞}a_{n}=r[/math]"
    @State private var limdefs : String = "[math]$lim_{n→∞}a_{n}=s[/math]"
    @State private var conclus : String = "[math]r=s[/math]"
    @State private var badconclus : String = "[math]r≠s[/math]"
    
    @State private var answer1: String = "[math]p and q ⇒ r[/math]"
    @State private var answer2: String = "[math]p and q and ¬r[/math]"
    
    @State private var showNumerical: Bool = false
    @State private var showAnswer: Bool = false
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Notice that we have shown that the following gives us a contradiction:").padding(10)
            VStack{
                HStack{
                    TextView(string: $limdefr).frame(width: 150, height: 30.0)
                    Text("and")}
                HStack{
                    TextView(string: $limdefs).frame(width: 150, height: 30.0)
                    Text("and")}
                TextView(string: $badconclus).frame(width: 55, height: 20).padding(.bottom, 10)
            }.modifier(GrayContainerStyle(opacity: 0.2))
            
            Text("Therefore the negation must be true:").padding(10)
            
            VStack{
                HStack{
                    Text("'if ")
                    TextView(string: $limdefr).frame(width: 150, height: 30.0)}
                HStack{
                    Text("and")
                    TextView(string: $limdefs).frame(width: 150, height: 30.0)}
                HStack{
                    Text("then ")
                    TextView(string: $conclus).frame(width: 55, height: 12.0)
                    Text("'")}.padding(.bottom, 5)
            }.modifier(GrayContainerStyle(opacity: 0.2))
            
            Text("Which proves our theorem!").bold().padding()
            
            Text("Try writing out the whole proof on your own to really understand each of the steps!").italic()
            
            Spacer()
            
        }.modifier(BlackDetailedAcademicTextStyle())
    }
}

struct UniqueLimitEasyProofExpl1_Previews: PreviewProvider {
    static var previews: some View {
        UniqueLimitEasyProofExpl4()
    }
}
