//
//  SwiftUIView.swift
//  firstTest
//
//  Created by Norbertas Blandis on 11/02/2023.
//

import SwiftUI

struct BlackTitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.system(size: 32))
            .multilineTextAlignment(.center)
            .padding(5)
    }
}

struct GrayTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 50)
            .background(Color(.lightGray))
            .foregroundColor(.white)
            .cornerRadius(10)
            .multilineTextAlignment(.center)
    }
}

struct GreenButtonWhiteTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 50)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct BlackTitleAcademicTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.custom("AmericanTypewriter", fixedSize: 20))
            .multilineTextAlignment(.center)
            .padding(3)
    }
}

struct BlackDetailedAcademicTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.custom("AmericanTypewriter", fixedSize: 18))
            .multilineTextAlignment(.center)
            .padding(20)
    }
}
