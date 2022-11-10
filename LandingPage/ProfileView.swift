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

struct ProfileView: View {
    
    let userId = Auth.auth().currentUser?.uid
    
    var body: some View {
        Text("This is my profile")
            .foregroundColor(Color.black)
            .font(.system(size: 32, weight: .bold))
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
