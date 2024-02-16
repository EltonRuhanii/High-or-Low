//
//  HighLowViewController+UIElements.swift
//  High or Low
//
//  Created by Kin+Carta on 16.2.24.
//

import UIKit

extension HighLowViewController {
    func appendElements() {
        higherButton.addTarget(self, action: #selector(higherPressed), for: .touchUpInside)
        lowerButton.addTarget(self, action: #selector(lowerPressed), for: .touchUpInside)
        view.addSubview(holderView)
        view.addSubview(navbar)
        navbar.addSubview(logo)
        navbar.addSubview(moneyHolder)
        navbar.addSubview(moneyLabel)
        holderView.addSubview(card)
        holderView.addSubview(higherButton)
        holderView.addSubview(lowerButton)
        holderView.addSubview(profitHolder)
        profitHolder.addSubview(totalProfitLabel)
        profitHolder.addSubview(profitHolderTwo)
        profitHolderTwo.addSubview(profitLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            navbar.topAnchor.constraint(equalTo: view.topAnchor),
            navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navbar.heightAnchor.constraint(equalToConstant: 100),
            
            moneyHolder.heightAnchor.constraint(equalToConstant: 40),
            moneyHolder.centerXAnchor.constraint(equalTo: navbar.centerXAnchor),
            moneyHolder.widthAnchor.constraint(equalToConstant: 160),
            moneyHolder.bottomAnchor.constraint(equalTo: navbar.bottomAnchor, constant: -6),
            
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logo.trailingAnchor.constraint(equalTo: moneyHolder.leadingAnchor),
            logo.centerYAnchor.constraint(equalTo: moneyHolder.centerYAnchor),
            
            moneyLabel.centerXAnchor.constraint(equalTo: moneyHolder.centerXAnchor),
            moneyLabel.centerYAnchor.constraint(equalTo: moneyHolder.centerYAnchor),
            
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
            
            lowerButton.topAnchor.constraint(equalTo: higherButton.bottomAnchor, constant: 20),
            lowerButton.widthAnchor.constraint(equalTo: higherButton.widthAnchor),
            lowerButton.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
            lowerButton.leadingAnchor.constraint(equalTo: higherButton.leadingAnchor),
            
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
            totalProfitLabel.leadingAnchor.constraint(equalTo: profitHolder.leadingAnchor, constant: 6),
            totalProfitLabel.trailingAnchor.constraint(equalTo: profitHolder.trailingAnchor, constant: -6),
            totalProfitLabel.heightAnchor.constraint(equalToConstant: 25),
            
            profitHolderTwo.topAnchor.constraint(equalTo: totalProfitLabel.bottomAnchor),
            profitHolderTwo.leadingAnchor.constraint(equalTo: totalProfitLabel.leadingAnchor),
            profitHolderTwo.trailingAnchor.constraint(equalTo: totalProfitLabel.trailingAnchor),
            profitHolderTwo.heightAnchor.constraint(equalToConstant: 40),
            
            profitLabel.topAnchor.constraint(equalTo: profitHolderTwo.topAnchor),
            profitLabel.leadingAnchor.constraint(equalTo: profitHolderTwo.leadingAnchor),
            profitLabel.trailingAnchor.constraint(equalTo: profitHolderTwo.trailingAnchor),
            profitLabel.bottomAnchor.constraint(equalTo: profitHolderTwo.bottomAnchor),
            
            profitHolder.bottomAnchor.constraint(equalTo: profitHolderTwo.bottomAnchor, constant: 12),
            holderView.bottomAnchor.constraint(equalTo: profitHolder.bottomAnchor, constant: 24),
        ])
    }
}