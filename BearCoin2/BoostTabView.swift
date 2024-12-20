//
//  BoostTabView.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/8/24.
//

import SwiftUI

struct BoostTabView: View {
    
    @Environment(GameState.self) private var gameState
    
    @State private var items: [listItem] = [
        listItem(iconName: "2x Clicks", name: "2x Clicks", cost: 5, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Loot Lake", name: "Loot Lake", cost: 25, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Bear necessities", name: "Bear necessities", cost: 100, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Discount Den", name: "Discount Den", cost: 500, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Hibearnation", name: "Hibearnation", cost: 1000, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Bear Troupe", name: "Bear Troupe", cost: 2500, milestone: nil, quantityOwned: 0)
    ]
    
    @State var shopTabClicked = false
    @State var mainTabClicked = false
    @State var boostTabClicked = false
    
    var body: some View {
        NavigationStack {
            listView(pageTitle: nil, color: .orange, items: $items)
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
                }
                .fullScreenCover(isPresented: $shopTabClicked) {
                    shopTabView()
                        .environment(gameState)
                }
                .fullScreenCover(isPresented: $mainTabClicked) {
                    MainPageView()
                        .environment(gameState)
                }
        }
    }
}


#Preview {
    BoostTabView()
        .environment(GameState.defaultState)
}
