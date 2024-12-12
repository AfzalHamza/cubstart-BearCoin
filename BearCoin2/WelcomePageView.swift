//
//  WelcomePageView.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/8/24.
//

import SwiftUI
import SwiftData

struct WelcomePageView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var gameStarted = false
    @State var gameState: GameState!
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                    .fill(.yellow)
                    .overlay(
                        VStack {
                            Text("BearCoin Mining")
                                .foregroundStyle(.white)
                                .font(.system(size: 65, weight: .bold, design: .rounded))
                                .multilineTextAlignment(.center)
                                .padding()
                            Image("AppLogo")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        })
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(.teal, lineWidth: 5))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                    .frame(width: 310, height: 327)
            Spacer()
            Text("TAP BELOW TO START")
                .foregroundStyle(.white)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .padding()
            Spacer()
            Button(action: { load() })
            {
                Image("WelcomePageBears")
                    .resizable()
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(.teal, lineWidth: 5))
            }
        }
        .fullScreenCover(isPresented: $gameStarted) {
            if let gameState {
                MainPageView()
                    .environment(gameState)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .onChange(of: gameState) {
            gameStarted.toggle()
        }
    }
    
    private func load() {
        let request = FetchDescriptor<GameState>()
        let data = try? modelContext.fetch(request)
        
        if let savedState = data?.first {
            gameState = savedState
        } else {
            let defaultGameState = GameState.defaultState
            gameState = defaultGameState
            
            do {
                modelContext.insert(defaultGameState)
                try modelContext.save()
            } catch {
                print("Cannot save \(error)")
            }
        }
    }
}

#Preview {
    WelcomePageView()
        .environment(GameState.defaultState)
}
