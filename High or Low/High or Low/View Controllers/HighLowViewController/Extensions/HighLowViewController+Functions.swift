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
        cardsArray.append("\(currentNumber)-\(cardType)")
        newNumber = Int(arc4random_uniform(13)) + 1
        lastNumber = currentNumber
        currentNumber = newNumber
        card.alpha = 0
        print(probailty[currentNumber-1])
        cardType = Int(arc4random_uniform(4)) + 1
        
        UIView.animate(withDuration: 1) {
            self.profitLabel.text = "\(self.betAmount * self.multiplier)"
            self.card.image = UIImage(named: "\(self.currentNumber)-\(self.cardType)")
            self.card.alpha = 1
        }
        collectionView.reloadData()
    }
    
    /// Handles the user guess, calls a set of functions which determine if the user guessed correct or wrong
    /// - Parameter higher: takes a boolean value to determine user guess, True for higher, False for lower
    func handleGuess(higher: Bool) {
        higherGuess = higher
        styleCard()
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
        userOne.betsLost += 1
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
                self.profitLabel.text = "\(String(format: "%.2f", self.betAmount * self.multiplier))"
                self.getNewNumber()
            }
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseInOut], animations: {
                self.card.layer.transform = CATransform3DMakeRotation(CGFloat.pi * 2, 0, 1, 0)
            }) { _ in
                
                self.checkGuess()
            }
        }
    }
    
    /// Resets the values and updates the UI
    func resetValues() {
        multiplier = 1.00
        totalProfitLabel.text = "Total Profit (\(String(format: "%.2f", multiplier))x)"
        moneyLabel.text = "$ \(String(format: "%.2f", userOne.moneyAmount))"
        betAmount = 0
    }
    
    func handleCorrectGuess() {
        calculateMultiplier()
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
            halfbetButton.isEnabled = false
            maxbetButton.isEnabled = false
            higherButton.isEnabled = true
            lowerButton.isEnabled = true
            higherButtonTitle.layer.opacity = 0.5
            higherButtonSubtitle.layer.opacity = 0.5 
            lowerButtonTitle.layer.opacity = 0.5
            lowerButtonSubtitle.layer.opacity = 0.5
            betButton.setTitle("Cashout", for: .normal)
            betAmountTF.isEnabled = false
        } else {
            halfbetButton.isEnabled = true
            maxbetButton.isEnabled = true
            higherButton.isEnabled = false
            lowerButton.isEnabled = false
            higherButtonTitle.layer.opacity = 1
            higherButtonSubtitle.layer.opacity = 1
            lowerButtonTitle.layer.opacity = 1
            lowerButtonSubtitle.layer.opacity = 01
            betButton.setTitle("Bet", for: .normal)
            betAmountTF.isEnabled = true
        }
    }
    
    @objc func betButtonPressed() {
        if isPlaying {
            userOne.betsWon += 1
            userOne.moneyMadeLost += Int(betAmount)
            UIView.animate(withDuration: 0.5) {
                self.calculateProfit()
                self.betButton.layer.opacity -= 0.5
                self.betButton.layer.opacity += 0.5
            }
        } else {
            cardsArray = []
            UIView.animate(withDuration: 0.5) {
                self.betPlaced()
                self.betButton.layer.opacity -= 0.5
                self.betButton.layer.opacity += 0.5
            }
        }
    }
    
    func showAlert() {
        alertTitle.text = "\(String(format: "%.2f", multiplier))x"
        alertSubtitle.text = "\(String(format: "%.2f", betAmount * multiplier))"
        wonAlertView.isHidden = false
    }
    
    func calculateProfit() {
        showAlert()
        isPlaying = false
        userOne.moneyAmount += betAmount * multiplier
        userOne.moneyMadeLost += Int(betAmount * multiplier)
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
                userOne.betsPlaced += 1
                moneyLabel.text = "$ \(String(format: "%.2f", userOne.moneyAmount))"
                wonAlertView.isHidden = true
                isPlaying = true
                handleIsPlaying()
            }
        } else {
            print("Failed to convert to integer")
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
