//
//  UnitTestingDemoApp.swift
//  UnitTestingDemo
//
//  Created by Durvesh Manjhi on 24/09/25.
//

import SwiftUI

@main
struct UnitTestingDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ToDoView()
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            switch newPhase {
            case .active:
                print("App is Active")
            case .inactive:
                print("App is Inactive")
            case .background:
                print("App is in Background")
            @unknown default:
                print("Unknown state")
            }
        }
    }
}
