//
//  MainPageView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI

struct MainPageView: View {
    
    @State private var goToLesson0 = false
    @State private var goToLesson1 = false
    @State private var goToLesson2 = false
    
    @State private var isLesson0Unlocked = true
    @State private var isLesson1Unlocked = false
    @State private var isLesson2Unlocked = false
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                
                VStack{
                    
                    NavigationLink(
                        destination: Lesson0View(),
                        isActive: $goToLesson0){
                            Button(action: isLesson0Unlocked ? {goToLesson0.toggle()} : {}) {
                                HStack{
                                    Text("1. Prerequisites")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Text("10 min").padding()
                                    Spacer()
                                    Image(systemName:isLesson0Unlocked ? "lock.open" : "lock").padding()
                                }.padding(8.0)
                                .border(Color.black, width: 2)
                                .cornerRadius(10)
                            }
                    }.isDetailLink(false)
                    
                    NavigationLink(
                        destination: Lesson1View(),
                        isActive: $goToLesson1){
                            Button(action: isLesson1Unlocked ? {goToLesson1.toggle()} : {}) {
                                HStack{
                                    Text("2. Basic Sequences")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Text("20 min").padding()
                                    Spacer()
                                    Image(systemName:isLesson1Unlocked ? "lock.open" : "lock").padding()
                                }.padding(8)
                                .border(Color.black, width: 2)
                                .cornerRadius(10)
                            }
                    }
                    
                    NavigationLink(
                        destination: Lesson2View(),
                        isActive: $goToLesson2){
                            Button(action: isLesson2Unlocked ? {goToLesson2.toggle()} : {}) {
                                HStack{
                                    Text("3. Sequence examples")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 18, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                    Spacer()
                                    Text("10 min").padding()
                                    Spacer()
                                    Image(systemName:isLesson2Unlocked ? "lock.open" : "lock").padding()
                                }.padding(2)
                                .border(Color.black, width: 2)
                                .cornerRadius(10)
                            }
                    }
                }.padding(.all, 10)
                
            }.navigationBarTitle("Lessons").background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
