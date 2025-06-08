//
//  Collectivity_iOSAppApp.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/19/25.
//

import SwiftUI
import SwiftData

@main
struct Collectivity_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
