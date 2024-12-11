//
//  ContentView.swift
//  BearCoin
//
//  Created by Hamza Afzal on 11/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var gameState = GameState()
    @Environment(\.modelContext) private var modelContext

    
    var body: some View {
        WelcomePageView().environmentObject(gameState)
    }
}
    
    
#Preview {
    ContentView()
}
