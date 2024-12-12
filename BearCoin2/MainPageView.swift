//
//  MainPageView.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/8/24.
//

import SwiftUI
import Observation
import SwiftData

struct MainPageView: View {
    
    @Environment(GameState.self) private var gameState
    
    @State var shopTabClicked = false
    @State var mainTabClicked = false
    @State var boostTabClicked = false
    @State var progressPageClicked = false
    @State var statsPageClicked = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.yellow)
                        .overlay(
                            VStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.cyan)
                                    .frame(width: 266, height: 153)
                                    .overlay(
                                        Text("\(gameState.bearCoins) BearCoins")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 50, weight: .bold, design: .rounded))
                                            .multilineTextAlignment(.center)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                                    .stroke(.white, lineWidth: 5)
                                                    .frame(width: 266, height: 153)))
                                    .shadow(radius: 10)
                                    .padding(50)
                                Spacer()
                                Button(action: {
                                    gameState.bearCoins += 1 * gameState.multiplier })
                                {
                                    Image("CenterBear")
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                        .frame(width: 250, height: 250)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                                .stroke(.blue, lineWidth: 5)
                                                .frame(width: 250, height: 250))
                                        .shadow(radius: 10)
                                }
                            })
                }
            }
            .background(.blue)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    HStack {
                        Button(action: {
                            shopTabClicked.toggle()})
                        {
                            Image("Shop")
                                .resizable()
                                .frame(width: 65, height: 65)
                        }
                        Spacer()
                        Button(action: {
                            mainTabClicked.toggle()})
                        {
                            Image("Salmon")
                                .resizable()
                                .frame(width: 65, height: 65)
                        }
                        Spacer()
                        Button(action: {
                            boostTabClicked.toggle()})
                        {
                            Image("Boost")
                                .resizable()
                                .frame(width: 65, height: 65)
                        }
                    }
                    .padding(EdgeInsets(top: 35, leading: 10, bottom: 5, trailing: 10))
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        progressPageClicked.toggle()})
                    {
                        Image("Progress")
                            .resizable()
                            .frame(width: 65, height: 65)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        statsPageClicked.toggle()})
                    {
                        Image("AppLogo")
                            .resizable()
                            .frame(width: 90, height: 90)
                    }
                }
            }.toolbarTitleDisplayMode(.large)
            .fullScreenCover(isPresented: $shopTabClicked) {
                shopTabView()
                    .environment(gameState)
            }
            .fullScreenCover(isPresented: $boostTabClicked) {
                BoostTabView()
                    .environment(gameState)
            }
            .sheet(isPresented: $progressPageClicked) {
                ProgressPageView()
                    .environment(gameState)
            }
        }
    }
}

    
#Preview {
    MainPageView()
}
