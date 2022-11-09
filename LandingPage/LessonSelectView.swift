//
//  LessonSelectView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 07/11/2022.
//

import SwiftUI

struct LessonSelectView: View {
    
    @ObservedObject var lessonManager: LessonManager
    
    var body: some View {
        NavigationView{
            ScrollView{
                }
            }
    }
}

struct LessonSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LessonSelectView(lessonManager: LessonManager())
    }
}
