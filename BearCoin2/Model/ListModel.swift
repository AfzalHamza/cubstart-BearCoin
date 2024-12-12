//
//  ListModel.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/9/24.
//

import SwiftUI


class listItem: Identifiable, ObservableObject {
//    @Attribute(.unique) var id: UUID
    var id: UUID = UUID()
    let iconName: String
    let name: String
    let cost: Int?            // For shopTab & boostTab
    let milestone: Int?      // For progressPage - BearCoin amount
    var achieved: Bool? = false     // For progressPage - Checkmark
    var quantityOwned: Int?   // For shopTab & boostTab
    
    init(iconName: String, name: String, cost: Int? = nil, milestone: Int? = nil, achieved: Bool = false, quantityOwned: Int = 0) {
        self.id = UUID()
        self.iconName = iconName
        self.name = name
        self.cost = cost
        self.milestone = milestone
        self.achieved = achieved
        self.quantityOwned = quantityOwned
    }
    
    func increaseQuantity() {
        quantityOwned? += 1
    }
}


struct listItemView: View {
    @Binding var item: listItem
    
    @Environment(GameState.self) var gameState: GameState
    
    var body: some View {
        HStack {
            Image(item.iconName)
                .resizable()
                .frame(width: 70, height: 62)
            if let cost = item.cost {
                Spacer()
                VStack {
                    Text(item.name)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .bold()
                    Text("Cost: \(cost)")
                        .font(.title3)
                        .foregroundStyle(.blue)
                        .bold()
                }
                Spacer()
                Button("Buy") {
                    if gameState.purchaseItem(cost: cost) {
                        item.increaseQuantity()         // TODO: If item bought, then need to do functionality
                        if item.name == "Double Trouble" {
                            gameState.bearCoins *= 2
                        }
                        else if item.name == "2x Clicks" {
                            gameState.multiplier = 2
                        }
                        print("Purchased \(item.name)")
                        print(item.quantityOwned ?? 0)
                    } else {
                        print("Not enough coins")
                    }
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            else {
                VStack {
                    Text(item.name)
                        .foregroundStyle(.yellow)
                        .font(.title2)
                        .bold()
                    if let milestone = item.milestone {
                        Text("\(milestone) BearCoins")
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.blue)
                    }
                }
                if item.achieved == true {
                    Spacer()
                    Image("GreenCheckmark")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding()
                }
            }
        }.padding()
    }
}


struct listView: View {
    let pageTitle: String?
    let color: Color
    @Binding var items: [listItem]
    
    
    @Environment(GameState.self) var gameState: GameState
    
    var body: some View {
        if let pageTitle {
            Text(pageTitle)
                .foregroundStyle(.white)
                .font(.system(size: 65, weight: .bold, design: .rounded))
                .padding()
                .background(RoundedRectangle(cornerRadius: 20.0).fill(.yellow).stroke(.teal, lineWidth: 5))
        }
        List {
                ForEach($items) { $item in
                    listItemView(item: $item)}
                .listRowBackground(color)
                .listRowSeparator(.hidden)
        }.listStyle(.plain)
    
    }
}
