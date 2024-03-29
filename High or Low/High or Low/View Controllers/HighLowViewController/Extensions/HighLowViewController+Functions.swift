//
//  HighLowViewController+Functions.swift
//  High or Low
//
//  Created by Kin+Carta on 16.2.24.
//

import UIKit

extension HighLowViewController {
    // MARK: Button functions
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
    
    /// Action Button for profiile button, to send to profile view controller
    @objc func profileButtonPressed() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    /// Takes the current bet amount and doubles by 2
    @objc func doubleBet() {
        if let text = betAmountTF.text, let intValue = Double(text) {
            betAmount = intValue * 2
            betAmountTF.text = "\(betAmount)"
        } else {
            print("Failed to convert to integer")
        }
    }
    
    /// Takes the current bet amount and devides by 2
    @objc func halfBet() {
        if let text = betAmountTF.text, let intValue = Double(text) {
            betAmount = intValue / 2
            betAmountTF.text = "\(betAmount)"
        } else {
            print("Failed to convert to integer")
        }
    }
    
    // Hides the alert
    @objc func screenTapped() {
        if wonAlertView.isHidden == false {
            wonAlertView.isHidden = true
        }
    }
    
    // MARK: Get New Number
    // Gets a new random number and then updates the values, and card image
    func getNewNumber() {
        cardsArray.append("\(currentNumber)-\(cardType)")
        newNumber = Int(arc4random_uniform(13)) + 1
        lastNumber = currentNumber
        currentNumber = newNumber
        cardType = Int(arc4random_uniform(4)) + 1
        card.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.minMaxStyler()
            self.card.alpha = 1
            self.collectionView.reloadData()
        }
    }
    
    //  Styler for max/min card
    func minMaxStyler() {
        if currentNumber == 1 {
            lowerButtonTitle.text = "SAME"
        } else {
            lowerButtonTitle.text = "LOWER"
        }
        
        if currentNumber == 13 {
            higherButtonTitle.text = "SAME"
        } else {
            higherButtonTitle.text = "HIGHER"
        }
        self.profitLabel.text = "\(self.betAmount * self.multiplier)"
        self.card.image = UIImage(named: "\(self.currentNumber)-\(self.cardType)")
        higherButtonSubtitle.text = "\(probailty[currentNumber - 1].higher) %"
        lowerButtonSubtitle.text = "\(probailty[currentNumber - 1].lower) %"
    }
    // MARK: Handle Guess functions
    /// Handles the user guess, calls a set of functions which determine if the user guessed correct or wrong
    /// - Parameter higher: takes a boolean value to determine user guess, True for higher, False for lower
    func handleGuess(higher: Bool) {
        higherGuess = higher
        styleCard()
    }
    
    func checkGuess() {
        if higherGuess {
            compareCards(isHigher: true)
        } else {
            compareCards(isHigher: false)
        }
    }
    
    /// Handles wrong guess from user
    func handleWrongGuess() {
        wrongGuess = true
        userOne.betsLost += 1
        userOne.moneyMadeLost += Int(betAmount)
        styleCard()
        calculateLoss()
        wrongGuess = false
    }
    
    func compareCards(isHigher: Bool) {
        if (isHigher && newNumber >= lastNumber) || (!isHigher && newNumber <= lastNumber) {
            calculateMultiplier(isHigher: isHigher)
        } else {
            handleWrongGuess()
        }
    }
    
    // MARK: Styles the card
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
                
                self.getNewNumber()
            }
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseInOut], animations: {
                self.card.layer.transform = CATransform3DMakeRotation(CGFloat.pi * 2, 0, 1, 0)
            }) { _ in
                self.checkGuess()
            }
        }
    }
    
    // MARK: Reset the values
    /// Resets the values and updates the UI
    func resetValues() {
        multiplier = 1.00
        totalProfitLabel.text = "Total Profit (\(String(format: "%.2f", multiplier))x)"
        moneyLabel.text = "$ \(String(format: "%.2f", userOne.moneyAmount))"
        betAmount = 0
    }
    
    // MARK: Bet Actions
    func cashout() {
        userOne.betsWon += 1
        UIView.animate(withDuration: 0.5) {
            self.calculateProfit()
            self.betButton.layer.opacity -= 0.5
            self.betButton.layer.opacity += 0.5
        }
    }
    
    func handleBetPlaced() {
        cardsArray = []
        UIView.animate(withDuration: 0.5) {
            self.betPlaced()
            self.betButton.layer.opacity -= 0.5
            self.betButton.layer.opacity += 0.5
        }
    }
    
    // MARK: Handle isPlaying
    func handleIsPlaying() {
        if isPlaying {
            halfbetButton.isEnabled = false
            maxbetButton.isEnabled = false
            higherButton.isEnabled = true
            lowerButton.isEnabled = true
            higherButtonTitle.layer.opacity = 1
            higherButtonSubtitle.layer.opacity = 1
            lowerButtonTitle.layer.opacity = 1
            lowerButtonSubtitle.layer.opacity = 1
            betButton.setTitle("Cashout", for: .normal)
            betAmountTF.isEnabled = false
        } else {
            halfbetButton.isEnabled = true
            maxbetButton.isEnabled = true
            higherButton.isEnabled = false
            lowerButton.isEnabled = false
            higherButtonTitle.layer.opacity = 0.5
            higherButtonSubtitle.layer.opacity = 0.5
            lowerButtonTitle.layer.opacity = 0.5
            lowerButtonSubtitle.layer.opacity = 0.5
            betButton.setTitle("Bet", for: .normal)
            betAmountTF.isEnabled = true
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
        userOne.profit += betAmount * multiplier - betAmount
        resetValues()
        handleIsPlaying()
    }
    
    func calculateLoss() {
        isPlaying = false
        userOne.profit -= betAmount
        resetValues()
        handleIsPlaying()
    }
    
    func updateLabels() {
        multiplier = 1.0
        betAmount = 0
    }
    
    // MARK: Bet Placed
    /// Handles the action that will be called when bet button pressed, Which will change from Bet to Checkout depending on the case
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
    
    // MARK: Multiplier cases
    func calculateMultiplier(isHigher: Bool) {
        let multiplierForLowerGuess: [Double] = [
            3.13, 2.35, 1.97, 1.86, 1.75, 1.65, 1.55,
            1.42, 1.37, 1.33, 1.24, 1.18, 1.13 ]
        
        let multiplierForHigherGuess: [Double] = multiplierForLowerGuess.reversed()
        let index = lastNumber - 1
        let selectedMultiplier = isHigher ? multiplierForHigherGuess[index] : multiplierForLowerGuess[index]
        
        multiplier *= selectedMultiplier
        
        totalProfitLabel.text = "Total Profit (\(String(format: "%.2f", multiplier))x)"
        profitLabel.text = "\(String(format: "%.2f", self.betAmount * self.multiplier))"
    }
}
