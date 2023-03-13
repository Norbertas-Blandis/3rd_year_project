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

struct GreenButtonWhiteTextStyleHalf: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 140, height: 50)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct LessonSelectButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct GrayButtonWhiteTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 280, height: 50)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct GrayButtonWhiteTextStyleHalf: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 140, height: 50)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct BlackTitleAcademicTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.custom("Arial", fixedSize: 20))
            .multilineTextAlignment(.center)
            .padding(3)
    }
}

struct BlackDetailedAcademicTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.custom("Arial", fixedSize: 18))
            .multilineTextAlignment(.center)
            .padding(20)
    }
}

struct LightGreenContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.green.opacity(0.1))
            .cornerRadius(15)
    }
}

struct GreenHelpButtonStyle: ViewModifier {
    
    @State var isActivated: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(width: 120, height: 50)
            .background(isActivated ? Color.green : Color.green.opacity(0.5))
            .cornerRadius(10)
    }
}

struct GreenCheckAnswerButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(width: 180, height: 50)
            .background(Color.green)
            .cornerRadius(10)
    }
}

struct PulsatingButtonCoverStyle: ViewModifier {
    
    @State var showCover = false
    @State var isPulsating: Bool
    var explanationView: AnyView
    
    @State private var scaleFactor: CGFloat = 1.2
    
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(Color.green.opacity(0.1))
            .cornerRadius(5)
            .scaleEffect(isPulsating ? scaleFactor : 1.0)
            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
            .onAppear { isPulsating = false}
            .onDisappear { isPulsating = false}
            .onTapGesture { showCover.toggle()}
            .fullScreenCover(isPresented: $showCover, content: {
                AnyView(explanationView)
                Button(action: {
                    showCover = false
                    isPulsating = false
                }) {
                    Text("Understood")
                }.padding()
            })
    }
}

struct PulsatingButtonCoverStyleFullFrame: ViewModifier {
    
    @State var showCover = false
    @State var isPulsating: Bool
    var explanationView: AnyView
    
    @State private var scaleFactor: CGFloat = 1.2
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(5)
            .background(Color.green.opacity(0.1))
            .cornerRadius(5)
            .scaleEffect(isPulsating ? scaleFactor : 1.0)
            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
            .onAppear { isPulsating = false}
            .onDisappear { isPulsating = false}
            .onTapGesture { showCover.toggle()}
            .fullScreenCover(isPresented: $showCover, content: {
                AnyView(explanationView)
                Button(action: {
                    showCover = false
                    isPulsating = false
                }) {
                    Text("Understood")
                }.padding()
            })
    }
}

struct NotPulsatingButtonCoverStyleFullFrame: ViewModifier {
    
    @State var showCover = false
    var explanationView: AnyView
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(5)
            .background(Color.green.opacity(0.1))
            .cornerRadius(5)
            .onTapGesture { showCover.toggle()}
            .fullScreenCover(isPresented: $showCover, content: {
                AnyView(explanationView)
                Button(action: {
                    showCover = false
                }) {
                    Text("Understood")
                }.padding()
            })
    }
}
