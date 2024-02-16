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
    
    func getNewNumber() {
        newNumber = Int(arc4random_uniform(13)) + 1
        lastNumber = currentNumber
        currentNumber = newNumber
        UIView.animate(withDuration: 0.5) {
            self.card.image = UIImage(named: "\(self.currentNumber)")
        }
    }
    
    func handleGuess(higher: Bool) {
        higherGuess = higher
        styleCard()
        sleep(UInt32(0.5))
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
    
    func handleWrongGuess() {
        wrongGuess = true
        styleCard()
        resetValues()
        wrongGuess = false
    }
    
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
}
