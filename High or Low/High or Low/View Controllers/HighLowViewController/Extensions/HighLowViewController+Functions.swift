//
//  HighLowViewController+Functions.swift
//  High or Low
//
//  Created by Kin+Carta on 16.2.24.
//

import UIKit

extension HighLowViewController {
    @objc func higherPressed() {
        handleGuess(higher: true)
    }
    
    @objc func lowerPressed() {
        handleGuess(higher: false)
    }
    
    // Gets a new random number and then updates the values, and card image
    func getNewNumber() {
        newNumber = Int(arc4random_uniform(13)) + 1
        lastNumber = currentNumber
        currentNumber = newNumber
        UIView.animate(withDuration: 0.5) {
            self.card.image = UIImage(named: "\(self.currentNumber)")
        }
    }
    
    
    /// Handles the user guess, calls a set of functions which determine if the user guessed correct or wrong
    /// - Parameter higher: takes a boolean value to determine user guess, True for higher, False for lower
    func handleGuess(higher: Bool) {
        higherGuess = higher
        styleCard()
        getNewNumber()
        checkGuess()
    }
    
    func checkGuess() {
        if higherGuess {
            higherCard()
        } else {
            lowerCard()
        }
    }
    
    /// Handles wrong guess from user
    func handleWrongGuess() {
        wrongGuess = true
        styleCard()
        calculateLoss()
        resetValues()
        wrongGuess = false
    }
    
    /// Styles the card, When the user guesses incorrect the card gets a red border to let the user know they were wrong, Also animates the change of the card
    func styleCard() {
        if wrongGuess {
            UIView.animate(withDuration: 0.5) {
                self.card.layer.borderWidth = 5
                self.profitLabel.text = "1.00"
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.card.layer.borderWidth = 0
                self.card.layer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 1, 0)
                self.profitLabel.text = "\(self.betAmount * self.multiplier)"
            }
            UIView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseIn], animations: {
                self.card.layer.transform = CATransform3DMakeRotation(CGFloat.pi * 2, 0, 1, 0)
                    }, completion: nil)
        }
    }
    
    func resetValues() {
        multiplier = 1.00
        totalProfitLabel.text = "Total Profit (\(String(format: "%.2f", multiplier))x)"
        moneyLabel.text = "\(String(format: "%.2f", userOne.moneyAmount))"
        betAmount = 0
    }
    
    func handleCorrectGuess() {
        calculateMultiplier()
        print(multiplier)
    }
    
    func calculateMultiplier() {
        if (lastNumber > 10 && higherGuess) || (lastNumber < 4 && !higherGuess) {
            multiplier = multiplier * 2.23
        } else {
            multiplier = multiplier * 1.35
        }
        totalProfitLabel.text = "Total Profit (\(String(format: "%.2f", multiplier))x)"
    }
    
    func higherCard() {
        if newNumber >= lastNumber {
            handleCorrectGuess()
        } else {
            handleWrongGuess()
        }
    }
    
    func lowerCard() {
        if newNumber <= lastNumber {
            handleCorrectGuess()
        } else {
            handleWrongGuess()
        }
    }
    
    func handleIsPlaying() {
        if isPlaying {
            higherButton.isEnabled = true
            lowerButton.isEnabled = true
            betButton.setTitle("Cashout", for: .normal)
            betAmountTF.isEnabled = false
        } else {
            higherButton.isEnabled = false
            lowerButton.isEnabled = false
            betButton.setTitle("Bet", for: .normal)
            betAmountTF.isEnabled = true
        }
    }
    
    @objc func betButtonPressed() {
        if isPlaying {
            // CASHOUT
            UIView.animate(withDuration: 0.5) {
                self.calculateProfit()
                self.betButton.layer.opacity -= 0.5
                self.betButton.layer.opacity += 0.5
            }
        } else {
            // Bet Placed
            UIView.animate(withDuration: 0.5) {
                self.betPlaced()
                self.betButton.layer.opacity -= 0.5
                self.betButton.layer.opacity += 0.5
            }
        }
            
    }
    
    func calculateProfit() {
        isPlaying = false
        userOne.moneyAmount += betAmount * multiplier
        resetValues()
        handleIsPlaying()
    }
    
    func calculateLoss() {
        isPlaying = false
        resetValues()
        handleIsPlaying()
    }
    
    func updateLabels() {
        multiplier = 1.0
        betAmount = 0
    }
    
    func betPlaced() {
        if let text = betAmountTF.text, let intValue = Double(text) {
            if intValue > userOne.moneyAmount {
                betAmountView.backgroundColor = .red
            } else {
                betAmountView.backgroundColor = .secondaryColor
                betAmount = intValue
                userOne.moneyAmount -= betAmount
                moneyLabel.text = "\(String(format: "%.2f", userOne.moneyAmount))"
                isPlaying = true
                handleIsPlaying()
            }
        } else {
            print("Failed to convert to integer")
        }
    }

}
