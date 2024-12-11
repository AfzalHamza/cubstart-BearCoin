//
//  GameState.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/10/24.
//

import SwiftUI

class GameState: ObservableObject {
    @Published var bearCoins: Int = 0
    @Published var multiplier: Int = 1

    func purchaseItem(cost: Int) -> Bool {
        if bearCoins >= cost {
            bearCoins -= cost
            return true
        } else {
            return false
        }
    }
}
