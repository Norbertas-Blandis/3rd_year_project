//
//  AcademicWritingViews.swift
//  firstTest
//
//  Created by Norbertas Blandis on 12/02/2023.
//

import SwiftUI

func SubscriptString(main: String, sub: String) -> some View {
    return (Text(main)+Text(sub).baselineOffset(-10).font(.system(size: 15)))
}

struct MainSequenceDefinitionView: View{
    
    var body: some View{
        HStack{
            SubscriptString(main: "(a",sub: "n")
            SubscriptString(main: ")",sub: "n∈N")
        }
    }
}
