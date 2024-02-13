//
//  GameViewController+Functions.swift
//  High or Low
//
//  Created by Kin+Carta on 9.2.24.
//

import UIKit

extension GameViewController {
    // MARK: - UI FUNCTIONS
    func setupUIElements() {
        corners = self.view.frame.width / 2
        newCardLabel.text = "\(currentNumber)"
        lastCardLabel.text = "\(lastNumber)"
        multiplierLabel.text = "x \(multiplier)"
        higherButton.backgroundColor = UIColor(named: "Green Gradient End")
        multiplierView.backgroundColor = UIColor(named: "Green Gradient End")
        moneyAmountLabel.text = "$ \(String(format: "%.2f", userOne.moneyAmount))"
    }
    
    func getNewNumber() {
        let randomNumber = Int(arc4random_uniform(10)) + 1
        newNumber = randomNumber
    }

    func updateNewNumber() {
        getNewNumber()
        lastNumber = currentNumber
        currentNumber = newNumber
        UIView.transition(with: lastCard, duration: 0.5, options: .transitionCurlUp) {
            self.lastCardLabel.text = "\(self.lastNumber)"
        }
        
        UIView.transition(with: newCard, duration: 0.5, options: .transitionCurlUp) {
            self.newCardLabel.text = "\(self.newNumber)"
        }
    }
    
    func resetValues() {
        multiplier = 1.0
        moneyAmountLabel.text = "\(String(format: "%.2f", userOne.moneyAmount))"
        multiplierLabel.text = "\(multiplier)"
        
    }
    
    // MARK: - GAME LOGIC
    func checkForWin() {
        getNewNumber()
        updateNewNumber()
        
        if userGuess == "Higher" {
            if currentNumber >= lastNumber {
                updateMultiplier(isHigher: true)
            } else {
                wrongGuess()
            }
        } else {
            if currentNumber <= lastNumber {
                updateMultiplier(isHigher: false)
            } else {
                wrongGuess()
                updateLossStatistics()
            }
        }
    }

    private func updateMultiplier(isHigher: Bool) {
        if isHigher {
            multiplier *= (lastNumber >= 7) ? 3.2 : 1.33
        } else {
            multiplier *= (lastNumber <= 3) ? 3.2 : 1.3
        }
        
        let formattedMultiplier = String(format: "%.2f", multiplier)
        multiplierLabel.text = formattedMultiplier
    }

    private func updateLossStatistics() {
        userOne.moneyAmount -= betAmount
        userOne.betsLost += 1
        userOne.moneyMadeLost -= Int(betAmount)
    }
    
    // MARK: BUTTON FUNCTIONS
    @objc func higherPressed() {
        handleGuess("Higher", button: higherButton)
    }

    @objc func lowerPressed() {
        handleGuess("Lower", button: lowerButton)
    }

    private func handleGuess(_ guess: String, button: UIButton) {
        userGuess = guess
        checkForWin()
        animateButton(button)
    }

    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.5) {
            button.layer.opacity -= 0.5
            button.layer.opacity += 0.5
        }
    }
    
    @objc func cashoutPressed() {
        getNewNumber()
        updateNewNumber()
        checkout()
        multiplierLabel.text = "\(multiplier)"
        UIView.animate(withDuration: 0.5) {
            self.cashoutButton.layer.opacity -= 0.5
            self.cashoutButton.layer.opacity += 0.5
        }
    }
    
    func checkout() {
        calculateProfit()
        resetValues()
        navigationController?.popViewController(animated: true)
    }
    
    func wrongGuess() {
        userOne.moneyMadeLost -= Int(betAmount)
        userOne.betsLost += 1
        userOne.betsPlaced += 1
        userOne.profit = false
        multiplier = 1.08
        navigationController?.popViewController(animated: true)
//        showAlert()
        
    }
    
    func calculateProfit() {
        userOne.moneyAmount += betAmount * multiplier
        userOne.betsWon += 1
        userOne.betsPlaced += 1
        userOne.profit = true
        userOne.moneyMadeLost += Int(betAmount * multiplier)
    }
    
    func showAlert() {
        UIView.animate(withDuration: 0.5) {
            self.blurView.isHidden = false
            self.alert.isHidden = false
        }
    }
    
    func hideAlert() {
        UIView.animate(withDuration: 0.5) {
            self.blurView.isHidden = true
            self.alert.isHidden = true
        }
    }
    
    @objc func didPressDeposit() {
        UIView.animate(withDuration: 0.5) {
            self.depositButton.layer.opacity -= 0.5
            self.depositButton.layer.opacity += 0.5
            self.hideAlert()
        }
    }
}
