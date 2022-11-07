//
//  LandingPage.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI

struct LandingPage: View {
    
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex){
            
            MainPageView()
                .onTapGesture{
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house").foregroundColor(Color.black)
                }.tag(0)
            
            ProfileView()
                .onTapGesture{
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "person").foregroundColor(Color.black)
                }.tag(1)
            
            QuizView()
                .onTapGesture{
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "questionmark").foregroundColor(Color.black)
                }.tag(2)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandingPage()
        }
    }
}
