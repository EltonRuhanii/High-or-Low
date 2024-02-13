//
//  BetViewController+FunctionExtension.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 9.2.24.
//

import UIKit

extension BetViewController {
    func setupUIElements() {
        setupLabels()
        setupButtons()
        
        view.addSubview(topView)
        topView.addSubview(moneyAmountLabel)
        topView.addSubview(lastCard)
        topView.addSubview(newCard)
        view.addSubview(bottomView)
        bottomView.addSubview(oneDollar)
        bottomView.addSubview(fiveDollars)
        bottomView.addSubview(tenDollars)
        bottomView.addSubview(twentyDollars)
        bottomView.addSubview(fiftyDollars)
        bottomView.addSubview(hundredDollars)
        
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: -corners),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            moneyAmountLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            moneyAmountLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            moneyAmountLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lastCard.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            lastCard.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -125),
            lastCard.widthAnchor.constraint(equalToConstant: 90),
            lastCard.heightAnchor.constraint(equalToConstant: 160),
            
            newCard.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            newCard.topAnchor.constraint(equalTo:lastCard.topAnchor),
            newCard.widthAnchor.constraint(equalToConstant: 90),
            newCard.heightAnchor.constraint(equalToConstant: 160),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            oneDollar.bottomAnchor.constraint(equalTo: tenDollars.topAnchor, constant: -10),
            oneDollar.heightAnchor.constraint(equalToConstant: 40),
            oneDollar.widthAnchor.constraint(equalToConstant: 120),
            oneDollar.trailingAnchor.constraint(equalTo: tenDollars.trailingAnchor),
            
            fiveDollars.bottomAnchor.constraint(equalTo: tenDollars.topAnchor, constant: -10),
            fiveDollars.heightAnchor.constraint(equalToConstant: 40),
            fiveDollars.widthAnchor.constraint(equalToConstant: 120),
            fiveDollars.leadingAnchor.constraint(equalTo: twentyDollars.leadingAnchor),
            
            tenDollars.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            tenDollars.trailingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -10),
            tenDollars.heightAnchor.constraint(equalToConstant: 40),
            tenDollars.widthAnchor.constraint(equalToConstant: 120),
            
            twentyDollars.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            twentyDollars.leadingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 10),
            twentyDollars.heightAnchor.constraint(equalToConstant: 40),
            twentyDollars.widthAnchor.constraint(equalToConstant: 120),
            
            fiftyDollars.topAnchor.constraint(equalTo: tenDollars.bottomAnchor, constant: 10),
            fiftyDollars.heightAnchor.constraint(equalToConstant: 40),
            fiftyDollars.widthAnchor.constraint(equalToConstant: 120),
            fiftyDollars.trailingAnchor.constraint(equalTo: tenDollars.trailingAnchor),
            
            hundredDollars.topAnchor.constraint(equalTo: tenDollars.bottomAnchor, constant: 10),
            hundredDollars.heightAnchor.constraint(equalToConstant: 40),
            hundredDollars.widthAnchor.constraint(equalToConstant: 120),
            hundredDollars.leadingAnchor.constraint(equalTo: twentyDollars.leadingAnchor),
            ])
    }
}
