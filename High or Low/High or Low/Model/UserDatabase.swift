//
//  File.swift
//  High or Low
//
//  Created by Kin+Carta on 7.2.24.
//

import Foundation


class UserDatabase {
    var userOne: UserModel = UserModel(username: "WIZZ", moneyAmount: 1000.0, betsPlaced: 0, betsWon: 0, betsLost: 0, profit: false, moneyMadeLost: 0)
}

// TODO: -
// Make it workable so it is ready to add core data in the future

import UIKit

extension UIColor {
    static let primaryColor = UIColor(red: 0.06, green: 0.13, blue: 0.18, alpha: 1.00)
    static let secondaryColor = UIColor(red: 0.18, green: 0.27, blue: 0.33, alpha: 1.00)
    static let backgroundColor = UIColor(red: 0.10, green: 0.17, blue: 0.22, alpha: 1.00)
    static let accentColor = UIColor(red: 0.08, green: 0.46, blue: 0.88, alpha: 1.00)
    static let textColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00)
}
