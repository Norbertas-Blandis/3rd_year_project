//
//  ProfileView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 24/10/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("This is my profile")                    .foregroundColor(Color.black)
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
