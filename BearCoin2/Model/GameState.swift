//
//  GameState.swift
//  BearCoin
//
//  Created by Hamza Afzal on 12/10/24.
//

import SwiftUI
import SwiftData

@Model
class GameState {
    var bearCoins: Int = 0
    var multiplier: Int = 1
    
    @Transient static var defaultState = GameState(bearCoins: 0, multiplier: 1)
    
    init(bearCoins: Int, multiplier: Int) {
        self.bearCoins = bearCoins
        self.multiplier = multiplier
    }

    func purchaseItem(cost: Int) -> Bool {
        if bearCoins >= cost {
            bearCoins -= cost
            return true
        } else {
            return false
        }
    }
}
