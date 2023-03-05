//
//  ContainerStyles.swift
//  firstTest
//
//  Created by Norbertas Blandis on 16/02/2023.
//

import SwiftUI

struct GrayContainerStyle: ViewModifier {
    
    var opacity: Double
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color.gray.opacity(opacity))
            .cornerRadius(10)
//            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 15))
    }
}
