//
//  HighLowViewController+UIElements.swift
//  High or Low
//
//  Created by Kin+Carta on 16.2.24.
//

import UIKit

let userOne = UserDatabase().userOne
extension HighLowViewController {
    func appendElements() {
        profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        higherButton.addTarget(self, action: #selector(higherPressed), for: .touchUpInside)
        lowerButton.addTarget(self, action: #selector(lowerPressed), for: .touchUpInside)
        betButton.addTarget(self, action: #selector(betButtonPressed), for: .touchUpInside)
        maxbetButton.addTarget(self, action: #selector(doubleBet), for: .touchUpInside)
        halfbetButton.addTarget(self, action: #selector(halfBet), for: .touchUpInside)
        
        view.addSubview(holderView)
        view.addSubview(navbar)
        navbar.addSubview(logo)
        navbar.addSubview(moneyHolder)
        navbar.addSubview(moneyLabel)
        navbar.addSubview(profileButton)
        
        holderView.addSubview(card)
        holderView.addSubview(higherButton)
        higherButton.addSubview(higherButtonTitle)
        higherButton.addSubview(higherButtonSubtitle)
        holderView.addSubview(lowerButton)
        lowerButton.addSubview(lowerButtonTitle)
        lowerButton.addSubview(lowerButtonSubtitle)
        holderView.addSubview(profitHolder)
        profitHolder.addSubview(totalProfitLabel)
        profitHolder.addSubview(profitHolderTwo)
        profitHolderTwo.addSubview(profitLabel)
        view.addSubview(collectionView)
        
        view.addSubview(bottomView)
        bottomView.addSubview(betAmountLabel)
        bottomView.addSubview(betAmountView)
        betAmountView.addSubview(betAmountTF)
        betAmountView.addSubview(halfbetButton)
        betAmountView.addSubview(maxbetButton)
        bottomView.addSubview(betButton)
        
        view.addSubview(wonAlertView)
        wonAlertView.addSubview(alertTitle)
        wonAlertView.addSubview(alertSubtitle)
        wonAlertView.addSubview(alertCenter)
    }
    
    func setupConstraints() {
        let viewFiller: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .backgroundColor
            return view
        }()
        
        view.addSubview(viewFiller)
        
        NSLayoutConstraint.activate([
            viewFiller.topAnchor.constraint(equalTo: view.topAnchor),
            viewFiller.bottomAnchor.constraint(equalTo: navbar.topAnchor),
            viewFiller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewFiller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            navbar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navbar.heightAnchor.constraint(equalToConstant: 60),
            
            moneyHolder.heightAnchor.constraint(equalToConstant: 40),
            moneyHolder.centerXAnchor.constraint(equalTo: navbar.centerXAnchor),
            moneyHolder.widthAnchor.constraint(equalToConstant: 160),
            moneyHolder.bottomAnchor.constraint(equalTo: navbar.bottomAnchor, constant: -6),
            
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logo.trailingAnchor.constraint(equalTo: moneyHolder.leadingAnchor),
            logo.centerYAnchor.constraint(equalTo: moneyHolder.centerYAnchor),
            
            moneyLabel.centerXAnchor.constraint(equalTo: moneyHolder.centerXAnchor),
            moneyLabel.centerYAnchor.constraint(equalTo: moneyHolder.centerYAnchor),
            
            profileButton.heightAnchor.constraint(equalToConstant: 70),
            profileButton.widthAnchor.constraint(equalToConstant: 70),
            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            profileButton.centerYAnchor.constraint(equalTo: moneyHolder.centerYAnchor),
            
            holderView.topAnchor.constraint(equalTo: navbar.bottomAnchor, constant: 24),
            holderView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            card.trailingAnchor.constraint(equalTo: holderView.centerXAnchor, constant: -15),
            card.widthAnchor.constraint(equalToConstant: 110),
            card.heightAnchor.constraint(equalTo: card.widthAnchor, multiplier: 1.6),
            card.centerYAnchor.constraint(equalTo: higherButton.bottomAnchor, constant: 10),
            
            higherButton.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 32),
            higherButton.widthAnchor.constraint(equalToConstant: 90),
            higherButton.heightAnchor.constraint(equalTo: higherButton.widthAnchor, multiplier: 1.25),
            higherButton.leadingAnchor.constraint(equalTo: holderView.centerXAnchor, constant: 15),
            
            higherButtonTitle.leadingAnchor.constraint(equalTo: higherButton.leadingAnchor),
            higherButtonTitle.trailingAnchor.constraint(equalTo: higherButton.trailingAnchor),
            
            higherButtonSubtitle.topAnchor.constraint(equalTo: higherButtonTitle.bottomAnchor),
            higherButtonSubtitle.leadingAnchor.constraint(equalTo: higherButtonTitle.leadingAnchor),
            higherButtonSubtitle.trailingAnchor.constraint(equalTo: higherButtonTitle.trailingAnchor),
            higherButtonSubtitle.bottomAnchor.constraint(equalTo: higherButton.bottomAnchor, constant: -6),
            
            lowerButton.topAnchor.constraint(equalTo: higherButton.bottomAnchor, constant: 20),
            lowerButton.widthAnchor.constraint(equalTo: higherButton.widthAnchor),
            lowerButton.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
            lowerButton.leadingAnchor.constraint(equalTo: higherButton.leadingAnchor),
            
            lowerButtonTitle.leadingAnchor.constraint(equalTo: lowerButton.leadingAnchor),
            lowerButtonTitle.trailingAnchor.constraint(equalTo: lowerButton.trailingAnchor),
            lowerButtonTitle.topAnchor.constraint(equalTo: lowerButton.topAnchor, constant: 6),
            
            lowerButtonSubtitle.topAnchor.constraint(equalTo: lowerButtonTitle.bottomAnchor),
            lowerButtonSubtitle.leadingAnchor.constraint(equalTo: lowerButtonTitle.leadingAnchor),
            lowerButtonSubtitle.trailingAnchor.constraint(equalTo: lowerButtonTitle.trailingAnchor),
            
            profitHolderTwo.topAnchor.constraint(equalTo: totalProfitLabel.bottomAnchor),
            profitHolderTwo.leadingAnchor.constraint(equalTo: profitHolder.leadingAnchor, constant: 12),
            profitHolderTwo.trailingAnchor.constraint(equalTo: profitHolder.trailingAnchor, constant: -12),
            
            profitLabel.topAnchor.constraint(equalTo: profitHolderTwo.topAnchor),
            profitLabel.trailingAnchor.constraint(equalTo: profitHolderTwo.trailingAnchor),
            profitLabel.leadingAnchor.constraint(equalTo: profitHolderTwo.leadingAnchor),
            profitLabel.heightAnchor.constraint(equalToConstant: 35),
            
            profitHolder.topAnchor.constraint(equalTo: lowerButton.bottomAnchor, constant: 24),
            profitHolder.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 12),
            profitHolder.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -12),
            
            totalProfitLabel.topAnchor.constraint(equalTo: profitHolder.topAnchor),
            totalProfitLabel.leadingAnchor.constraint(equalTo: profitHolderTwo.leadingAnchor),
            totalProfitLabel.trailingAnchor.constraint(equalTo: profitHolder.trailingAnchor, constant: -6),
            totalProfitLabel.heightAnchor.constraint(equalToConstant: 25),
            
            profitHolderTwo.topAnchor.constraint(equalTo: totalProfitLabel.bottomAnchor),
            profitHolderTwo.leadingAnchor.constraint(equalTo: totalProfitLabel.leadingAnchor),
            profitHolderTwo.trailingAnchor.constraint(equalTo: totalProfitLabel.trailingAnchor),
            profitHolderTwo.heightAnchor.constraint(equalToConstant: 40),
            
            profitLabel.topAnchor.constraint(equalTo: profitHolderTwo.topAnchor),
            profitLabel.leadingAnchor.constraint(equalTo: profitHolderTwo.leadingAnchor, constant: 12),
            profitLabel.trailingAnchor.constraint(equalTo: profitHolderTwo.trailingAnchor),
            profitLabel.bottomAnchor.constraint(equalTo: profitHolderTwo.bottomAnchor),
            
            profitHolder.bottomAnchor.constraint(equalTo: profitHolderTwo.bottomAnchor, constant: 12),
            
            collectionView.topAnchor.constraint(equalTo: profitHolder.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: profitHolder.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: profitHolder.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            
            holderView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
        ])
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -15),
            bottomView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor),
            
            betAmountLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 12),
            betAmountLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -12),
            betAmountLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
            
            betAmountView.topAnchor.constraint(equalTo: betAmountLabel.bottomAnchor, constant: 12),
            betAmountView.leadingAnchor.constraint(equalTo: betAmountLabel.leadingAnchor),
            betAmountView.trailingAnchor.constraint(equalTo: betAmountLabel.trailingAnchor),
            betAmountView.heightAnchor.constraint(equalToConstant: 50),
            
            betAmountTF.topAnchor.constraint(equalTo: betAmountView.topAnchor, constant: 2),
            betAmountTF.leadingAnchor.constraint(equalTo: betAmountView.leadingAnchor, constant: 2),
            betAmountTF.trailingAnchor.constraint(equalTo: halfbetButton.leadingAnchor, constant: -2),
            betAmountTF.bottomAnchor.constraint(equalTo: betAmountView.bottomAnchor, constant: -2),
            
            maxbetButton.topAnchor.constraint(equalTo: betAmountView.topAnchor),
            maxbetButton.trailingAnchor.constraint(equalTo: betAmountView.trailingAnchor),
            maxbetButton.bottomAnchor.constraint(equalTo: betAmountView.bottomAnchor),
            maxbetButton.widthAnchor.constraint(equalToConstant: 60),
            
            halfbetButton.topAnchor.constraint(equalTo: maxbetButton.topAnchor),
            halfbetButton.trailingAnchor.constraint(equalTo: maxbetButton.leadingAnchor),
            halfbetButton.bottomAnchor.constraint(equalTo: maxbetButton.bottomAnchor),
            halfbetButton.widthAnchor.constraint(equalTo: maxbetButton.widthAnchor),
            
            betButton.topAnchor.constraint(equalTo: betAmountView.bottomAnchor, constant: 12),
            betButton.leadingAnchor.constraint(equalTo: betAmountLabel.leadingAnchor),
            betButton.trailingAnchor.constraint(equalTo: betAmountLabel.trailingAnchor),
            betButton.heightAnchor.constraint(equalToConstant: 40),
            
            bottomView.bottomAnchor.constraint(equalTo: betButton.bottomAnchor, constant: 12),
            
            wonAlertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wonAlertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wonAlertView.widthAnchor.constraint(equalToConstant: 150),
            wonAlertView.heightAnchor.constraint(equalToConstant: 100),
            
            alertTitle.bottomAnchor.constraint(equalTo: wonAlertView.centerYAnchor, constant: -8),
            alertTitle.leadingAnchor.constraint(equalTo: wonAlertView.leadingAnchor, constant: 16),
            alertTitle.trailingAnchor.constraint(equalTo: wonAlertView.trailingAnchor, constant: -16),
            
            alertCenter.centerYAnchor.constraint(equalTo: wonAlertView.centerYAnchor),
            alertCenter.centerXAnchor.constraint(equalTo: wonAlertView.centerXAnchor),
            alertCenter.heightAnchor.constraint(equalToConstant: 4),
            alertCenter.widthAnchor.constraint(equalToConstant: 50),
            
            alertSubtitle.topAnchor.constraint(equalTo: wonAlertView.centerYAnchor, constant: 8),
            alertSubtitle.leadingAnchor.constraint(equalTo: wonAlertView.leadingAnchor, constant: 16),
            alertSubtitle.trailingAnchor.constraint(equalTo: wonAlertView.trailingAnchor, constant: -16),
        ])
    }
}
