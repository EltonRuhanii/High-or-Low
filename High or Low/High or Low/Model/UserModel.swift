//
//  UserModel.swift
//  High or Low
//
//  Created by Kin+Carta on 7.2.24.
//

import Foundation

class UserModel {
    var username: String
    var moneyAmount: Double
    var betsPlaced: Int
    var betsWon: Int
    var betsLost: Int
    var profit: Double
    var moneyMadeLost: Int
    
    init(username: String, moneyAmount: Double, betsPlaced: Int, betsWon: Int, betsLost: Int, profit: Double, moneyMadeLost: Int) {
        self.username = username
        self.moneyAmount = moneyAmount
        self.betsPlaced = betsPlaced
        self.betsWon = betsWon
        self.betsLost = betsLost
        self.profit = profit
        self.moneyMadeLost = moneyMadeLost
    }
}
