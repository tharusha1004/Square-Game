//
//  Square_GameApp.swift
//  Square Game
//
//  Created by COCOBSCCOMP23.1P-022 on 2024-08-17.
//

import SwiftUI

@main
struct Square_GameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ScoreManager())
        }
    }
}
