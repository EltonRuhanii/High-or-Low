//
//  MinesVC+UIFunctions.swift
//  High or Low
//
//  Created by Kin+Carta on 26.2.24.
//

import UIKit

extension MinesViewController {
    func setupNavBar() {
        view.addSubview(navbar)
        view.addSubview(viewFiller)
        navbar.addSubview(logo)
        navbar.addSubview(moneyHolder)
        navbar.addSubview(moneyLabel)
        navbar.addSubview(profileButton)
        
        profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
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
            ])
    }
    
    func setupBottomView() {
        let bottomView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .secondaryColor
            view.layer.cornerRadius = 15
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            
            return view
        }()
        
        view.addSubview(bottomView)
        bottomView.addSubview(betAmountLabel)
        bottomView.addSubview(betAmountView)
        betAmountView.addSubview(betAmountTF)
        betAmountView.addSubview(halfbetButton)
        betAmountView.addSubview(maxbetButton)
        bottomView.addSubview(betButton)
        
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
        ])
    }
    
    func setupUI() {
        view.addSubview(holderView)
        holderView.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
            holderView.topAnchor.constraint(equalTo: navbar.bottomAnchor, constant: 24),
            holderView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -5),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor),
            
            holderView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
        ])
    }
    
}
