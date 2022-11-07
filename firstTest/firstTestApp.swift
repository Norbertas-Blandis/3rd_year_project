//
//  firstTestApp.swift
//  firstTest
//
//  Created by Norbertas Blandis on 01/10/2022.
//

import SwiftUI

@main
struct firstTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LandingPage()
        }
    }
}
