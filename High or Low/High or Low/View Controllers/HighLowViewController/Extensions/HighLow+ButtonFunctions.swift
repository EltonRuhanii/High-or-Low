//
//  HighLow+ButtonFunctions.swift
//  High or Low
//
//  Created by Kin+Carta on 4.3.24.
//

import UIKit

// MARK: - Button functions
extension HighLowViewController {
    @objc func higherPressed() {
        handleGuess(higher: true)
    }
    
    @objc func lowerPressed() {
        handleGuess(higher: false)
    }
    
    @objc func betButtonPressed() {
        if isPlaying {
            cashout()
        } else {
            handleBetPlaced()
        }
    }
    
    @objc func profileButtonPressed() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc func doubleBet() {
        if let text = betAmountTF.text, let intValue = Double(text) {
            betAmount = intValue * 2
            betAmountTF.text = "\(betAmount)"
        } else {
            print("Failed to convert to integer")
        }
    }
    
    @objc func halfBet() {
        if let text = betAmountTF.text, let intValue = Double(text) {
            betAmount = intValue / 2
            betAmountTF.text = "\(betAmount)"
        } else {
            print("Failed to convert to integer")
        }
    }
    
    @objc func screenTapped() {
        if wonAlertView.isHidden == false {
            wonAlertView.isHidden = true
        }
    }
}

