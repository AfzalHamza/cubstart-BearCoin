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
    @StateObject private var gameState = GameState()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            listItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameState)
                .modelContainer(for: [listItem.self])
            
        }
        .modelContainer(sharedModelContainer)
    }
}
