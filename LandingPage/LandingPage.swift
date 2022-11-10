//
//  LandingPage.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI

struct LandingPage: View {
    
//    @State private var selectedIndex = 0
    
    var body: some View {
        
        TabView{
            
            LessonSelectView(lessonManager: LessonManager())
                .tabItem {
                    Image(systemName: "house").foregroundColor(Color.black)
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person").foregroundColor(Color.black)
                }
            
            QuizView()
                .tabItem {
                    Image(systemName: "questionmark").foregroundColor(Color.black)
                }
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
