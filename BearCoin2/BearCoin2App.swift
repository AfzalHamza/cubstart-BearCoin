//
//  BearCoinApp.swift
//  BearCoin
//
//  Created by Hamza Afzal on 11/12/24.
//

import SwiftUI
import SwiftData

@main
struct BearCoin2App: App {
    var body: some Scene {
        WindowGroup {
            WelcomePageView()
                .modelContainer(for: GameState.self)
        }
    }
}
