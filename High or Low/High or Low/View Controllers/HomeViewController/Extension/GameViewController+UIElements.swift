//
// GameViewController+UIElements.swift
// High or Low
//
// Created by Elton Ruhani on 9.2.24
//

import UIKit


extension GameViewController {
    func setupUI() {
        lowerButton.addTarget(self, action: #selector(lowerPressed), for: .touchUpInside)
        higherButton.addTarget(self, action: #selector(higherPressed), for: .touchUpInside)
        cashoutButton.addTarget(self, action: #selector(cashoutPressed), for: .touchUpInside)
        depositButton.addTarget(self, action: #selector(didPressDeposit), for: .touchUpInside)
        view.backgroundColor = background
        topView.backgroundColor = primary
        topView.layer.cornerRadius = corners
        
        let bottomView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        view.addSubview(topView)
        topView.addSubview(moneyAmountLabel)
        view.addSubview(bottomView)
        topView.addSubview(lastCard)
        topView.addSubview(newCard)
        bottomView.addSubview(lowerButton)
        bottomView.addSubview(higherButton)
        bottomView.addSubview(cashoutButton)
        bottomView.addSubview(multiplierView)
        multiplierView.addSubview(multiplierLabel)
        
        lastCard.addSubview(lastCardLabel)
        newCard.addSubview(newCardLabel)
        
        newCardLeadingConstraint = newCard.leadingAnchor.constraint(equalTo: topView.centerXAnchor, constant: 10)
        lastCardTrailingConstraint = lastCard.trailingAnchor.constraint(equalTo: topView.centerXAnchor, constant: -10)
        newCardTrailingConstraint = newCard.trailingAnchor.constraint(equalTo: topView.centerXAnchor, constant: -10)
        lastCardLeadingConstraint = lastCard.leadingAnchor.constraint(equalTo: topView.centerXAnchor, constant: 10)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: -corners),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            moneyAmountLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            moneyAmountLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12),
            moneyAmountLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            lastCardTrailingConstraint,
            lastCard.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -125),
            lastCard.widthAnchor.constraint(equalToConstant: 90),
            lastCard.heightAnchor.constraint(equalToConstant: 160),
            
            lastCardLabel.centerXAnchor.constraint(equalTo: lastCard.centerXAnchor),
            lastCardLabel.centerYAnchor.constraint(equalTo: lastCard.centerYAnchor),
        
            newCardLeadingConstraint,
            newCard.topAnchor.constraint(equalTo:lastCard.topAnchor),
            newCard.widthAnchor.constraint(equalToConstant: 90),
            newCard.heightAnchor.constraint(equalToConstant: 160),
            
            newCardLabel.centerXAnchor.constraint(equalTo: newCard.centerXAnchor),
            newCardLabel.centerYAnchor.constraint(equalTo: newCard.centerYAnchor),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            lowerButton.bottomAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -10),
            lowerButton.widthAnchor.constraint(equalToConstant: 120),
            lowerButton.heightAnchor.constraint(equalToConstant: 40),
            lowerButton.trailingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: -10),
            
            higherButton.bottomAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -10),
            higherButton.widthAnchor.constraint(equalToConstant: 120),
            higherButton.heightAnchor.constraint(equalToConstant: 40),
            higherButton.leadingAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 10),
            
            cashoutButton.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 10),
            cashoutButton.leadingAnchor.constraint(equalTo: lowerButton.leadingAnchor),
            cashoutButton.trailingAnchor.constraint(equalTo: lowerButton.trailingAnchor),
            cashoutButton.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
            
            multiplierView.topAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: 10),
            multiplierView.leadingAnchor.constraint(equalTo: higherButton.leadingAnchor),
            multiplierView.trailingAnchor.constraint(equalTo: higherButton.trailingAnchor),
            multiplierView.heightAnchor.constraint(equalTo: higherButton.heightAnchor),
            
            multiplierLabel.leadingAnchor.constraint(equalTo: multiplierView.leadingAnchor, constant: 6),
            multiplierLabel.trailingAnchor.constraint(equalTo: multiplierView.trailingAnchor, constant: -6),
            multiplierLabel.topAnchor.constraint(equalTo: multiplierView.topAnchor, constant: 3),
            multiplierLabel.bottomAnchor.constraint(equalTo: multiplierView.bottomAnchor, constant: -3),
            
        ])
    }
    
    func setupAlert() {
        blurView.frame = view.bounds
        view.addSubview(blurView)
        view.addSubview(alert)
        alert.addSubview(alertIcon)
        alert.addSubview(alertTitle)
        alert.addSubview(alertSubtitle)
        alert.addSubview(depositButton)
        
        blurView.isHidden = true
        alert.isHidden = true
        
        NSLayoutConstraint.activate([
            alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            alert.heightAnchor.constraint(equalTo: alert.widthAnchor),
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            alertIcon.centerXAnchor.constraint(equalTo: alert.centerXAnchor),
            alertIcon.topAnchor.constraint(equalTo: alert.topAnchor, constant: 24),
            alertIcon.widthAnchor.constraint(equalToConstant: 50),
            alertIcon.heightAnchor.constraint(equalTo: alertIcon.widthAnchor),
            
            alertTitle.centerXAnchor.constraint(equalTo: alert.centerXAnchor),
            alertTitle.topAnchor.constraint(equalTo: alertIcon.bottomAnchor, constant: 24),
            
            alertSubtitle.leadingAnchor.constraint(equalTo: alert.leadingAnchor, constant: 24),
            alertSubtitle.trailingAnchor.constraint(equalTo: alert.trailingAnchor, constant: -24),
            alertSubtitle.topAnchor.constraint(equalTo: alertTitle.bottomAnchor, constant: 12),
            
            depositButton.bottomAnchor.constraint(equalTo: alert.bottomAnchor, constant: -24),
            depositButton.leadingAnchor.constraint(equalTo: alert.leadingAnchor, constant: 24),
            depositButton.trailingAnchor.constraint(equalTo: alert.trailingAnchor, constant: -24),
            depositButton.heightAnchor.constraint(equalToConstant: 60),
            ])
    }
}
