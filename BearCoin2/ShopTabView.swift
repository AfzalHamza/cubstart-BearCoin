//
//  ShopTabView.swift
//  BearCoin
//
//  Created by Hamza Afzal on 11/14/24.
//

import SwiftUI
import Foundation
import SwiftData


struct shopTabView: View {
    
    @State private var items: [listItem] = [
        listItem(iconName: "Double Trouble", name: "Double Trouble", cost: 5, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Porridge", name: "Porridge", cost: 25, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Honey", name: "Honey", cost: 100, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Goldilocks", name: "Goldilocks", cost: 1000, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Bear claw", name: "Bear Claw", cost: 5000, milestone: nil, quantityOwned: 0),
        listItem(iconName: "Picnic basket", name: "Picnic Basket", cost: 10000, milestone: nil, quantityOwned: 0)
    ]
    
    @State var shopTabClicked = false
    @State var mainTabClicked = false
    @State var boostTabClicked = false
    
    
    @EnvironmentObject var gameState: GameState
    
    var body: some View {
        NavigationStack {
            listView(pageTitle: nil, color: .yellow, items: $items)
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
                .fullScreenCover(isPresented: $mainTabClicked) {
                    MainPageView()
                }
                .fullScreenCover(isPresented: $boostTabClicked) {
                    BoostTabView()
                }
        }
    }
}
    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                ForEach(tab.itemList) {item in
//                    shopItemView(item: item, color: .yellow)}
//            }
//            .padding()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.blue)
//            .toolbar {
//                ToolbarItemGroup(placement: .bottomBar) {
//                    HStack {
//                        Button(action: {
//                            shopTabClicked.toggle()})
//                        {
//                            Image("Shop")
//                                .resizable()
//                                .frame(width: 65, height: 65)
//                        }
//                        Spacer()
//                        Button(action: {
//                            mainTabClicked.toggle()})
//                        {
//                            Image("Salmon")
//                                .resizable()
//                                .frame(width: 65, height: 65)
//                        }
//                        Spacer()
//                        Button(action: {
//                            boostTabClicked.toggle()})
//                        {
//                            Image("Boost")
//                                .resizable()
//                                .frame(width: 65, height: 65)
//                        }
//                    }
//                    .padding(EdgeInsets(top: 35, leading: 10, bottom: 5, trailing: 10))
//                }
//            }
//            .fullScreenCover(isPresented: $shopTabClicked) {
//                shopTabView(tab: tab)
//            }
//            .fullScreenCover(isPresented: $mainTabClicked) {
//                MainPageView()
//            }
//            .fullScreenCover(isPresented: $boostTabClicked) {
//                BoostTabView(tab: boostTab())
//            }
//        }
//    }

    
#Preview {
    shopTabView().environmentObject(GameState())
}
