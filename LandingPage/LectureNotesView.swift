//
//  ProfileView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestoreSwift

struct LectureNotesView: View {
    
    let userId = Auth.auth().currentUser?.uid
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                
            }.navigationTitle("Lecture Notes")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LectureNotesView()
    }
}
