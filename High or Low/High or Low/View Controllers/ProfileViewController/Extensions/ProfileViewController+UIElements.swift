//
//  ProfileViewController+UIElements.swift
//  High or Low
//
//  Created by Kin+Carta on 20.2.24.
//

import UIKit

extension ProfileViewController {
    func appendUIElements() {
        let viewFiller: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .backgroundColor
            return view
        }()
        
        let navbar: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .backgroundColor
            view.applyShadow()
            return view
        }()
        let logo: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Bet500"
            label.font = UIFont(name: "Medinah", size: 20)
            label.textColor = .white
            return label
        }()
        let moneyHolder: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .primaryColor
            view.layer.cornerRadius = 5
            return view
        }()
        let moneyLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "Fredoka", size: 16)
            label.text = "$ \(String(format: "%.2f", userOne.moneyAmount))"
            label.textColor = .white
            return label
        }()
        let profileButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(systemName: "house"), for: .normal)
            button.tintColor = .white
            return button
        }()
        
        let titleIcon: UIImageView = {
            let img = UIImageView()
            img.translatesAutoresizingMaskIntoConstraints = false
            img.image = UIImage(systemName: "info.circle.fill")
            img.tintColor = .white
            return img
        }()
        let screenTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Statistics"
            label.textColor = .textColor
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        let usernameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(userOne.username)"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()

        // Cell
        let totalBets: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.backgroundColor = .primaryColor
            view.applyShadow()
            return view
        }()
        let totalBetsTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Total Bets"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        let totalBetsValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(userOne.betsPlaced)"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        
        let moneyWagared: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.backgroundColor = .primaryColor
            view.applyShadow()
            return view
        }()
        let moneyWagaredTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Wagared"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        let moneyWagaredValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "$ \(userOne.moneyMadeLost)"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        
        let totalLosses: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.backgroundColor = .primaryColor
            view.applyShadow()
            return view
        }()
        let totalLossesTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Total Losses"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        let totalLossesValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(userOne.betsLost)"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        
        let totalWins: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.backgroundColor = .primaryColor
            view.applyShadow()
            return view
        }()
        let totalWinsTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Total Wins"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        let totalWinsValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(userOne.betsWon)"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        
        let profit: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.backgroundColor = .primaryColor
            view.applyShadow()
            return view
        }()
        let profitTitle: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Profit / Loss"
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        let profitValue: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "\(String(format: "%.2f", userOne.profit))"
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = .textColor
            return label
        }()
        
        profileButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        
        view.addSubview(navbar)
        navbar.addSubview(logo)
        navbar.addSubview(moneyHolder)
        navbar.addSubview(moneyLabel)
        navbar.addSubview(profileButton)
        
        view.addSubview(viewFiller)
        
        view.addSubview(titleIcon)
        view.addSubview(screenTitle)
        view.addSubview(usernameLabel)
        
        view.addSubview(totalBets)
        totalBets.addSubview(totalBetsTitle)
        totalBets.addSubview(totalBetsValue)
        
        view.addSubview(moneyWagared)
        moneyWagared.addSubview(moneyWagaredTitle)
        moneyWagared.addSubview(moneyWagaredValue)
        
        view.addSubview(totalLosses)
        totalLosses.addSubview(totalLossesTitle)
        totalLosses.addSubview(totalLossesValue)
        
        view.addSubview(totalWins)
        totalWins.addSubview(totalWinsTitle)
        totalWins.addSubview(totalWinsValue)
        
        view.addSubview(profit)
        profit.addSubview(profitTitle)
        profit.addSubview(profitValue)
        
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
            
            titleIcon.topAnchor.constraint(equalTo: navbar.bottomAnchor, constant: 24),
            titleIcon.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleIcon.heightAnchor.constraint(equalToConstant: 15),
            titleIcon.widthAnchor.constraint(equalToConstant: 15),
            
            screenTitle.leadingAnchor.constraint(equalTo: titleIcon.trailingAnchor,constant: 6),
            screenTitle.centerYAnchor.constraint(equalTo: titleIcon.centerYAnchor),
            screenTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: titleIcon.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            // Total Bets
            totalBets.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 24),
            totalBets.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            totalBets.heightAnchor.constraint(equalTo: totalBets.widthAnchor, multiplier: 0.5),
            totalBets.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -12),
            
            totalBetsTitle.bottomAnchor.constraint(equalTo: totalBets.centerYAnchor, constant: -3),
            totalBetsTitle.leadingAnchor.constraint(equalTo: totalBets.layoutMarginsGuide.leadingAnchor),
            totalBetsTitle.trailingAnchor.constraint(equalTo: totalBets.layoutMarginsGuide.trailingAnchor),
            
            totalBetsValue.topAnchor.constraint(equalTo: totalBets.centerYAnchor, constant: 3),
            totalBetsValue.leadingAnchor.constraint(equalTo: totalBets.layoutMarginsGuide.leadingAnchor),
            totalBetsValue.trailingAnchor.constraint(equalTo: totalBets.layoutMarginsGuide.trailingAnchor),
            // Money Wagared
            moneyWagared.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 24),
            moneyWagared.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            moneyWagared.heightAnchor.constraint(equalTo: moneyWagared.widthAnchor, multiplier: 0.5),
            moneyWagared.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 12),
            
            moneyWagaredTitle.bottomAnchor.constraint(equalTo: moneyWagared.centerYAnchor, constant: -3),
            moneyWagaredTitle.leadingAnchor.constraint(equalTo: moneyWagared.layoutMarginsGuide.leadingAnchor),
            moneyWagaredTitle.trailingAnchor.constraint(equalTo: moneyWagared.layoutMarginsGuide.trailingAnchor),
            
            moneyWagaredValue.topAnchor.constraint(equalTo: moneyWagared.centerYAnchor, constant: 3),
            moneyWagaredValue.leadingAnchor.constraint(equalTo: moneyWagared.layoutMarginsGuide.leadingAnchor),
            moneyWagaredValue.trailingAnchor.constraint(equalTo: moneyWagared.layoutMarginsGuide.trailingAnchor),
            // Total Losses
            totalLosses.topAnchor.constraint(equalTo: totalBets.bottomAnchor, constant: 24),
            totalLosses.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor),
            totalLosses.heightAnchor.constraint(equalTo: totalLosses.widthAnchor, multiplier: 0.5),
            totalLosses.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -12),
            
            totalLossesTitle.bottomAnchor.constraint(equalTo: totalLosses.centerYAnchor, constant: -3),
            totalLossesTitle.leadingAnchor.constraint(equalTo: totalLosses.layoutMarginsGuide.leadingAnchor),
            totalLossesTitle.trailingAnchor.constraint(equalTo: totalLosses.layoutMarginsGuide.trailingAnchor),
            
            totalLossesValue.topAnchor.constraint(equalTo: totalLosses.centerYAnchor, constant: 3),
            totalLossesValue.leadingAnchor.constraint(equalTo: totalLosses.layoutMarginsGuide.leadingAnchor),
            totalLossesValue.trailingAnchor.constraint(equalTo: totalLosses.layoutMarginsGuide.trailingAnchor),
            
            // Total Wins
            totalWins.topAnchor.constraint(equalTo: totalLosses.topAnchor),
            totalWins.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            totalWins.heightAnchor.constraint(equalTo: totalWins.widthAnchor, multiplier: 0.5),
            totalWins.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 12),
            
            totalWinsTitle.bottomAnchor.constraint(equalTo: totalWins.centerYAnchor, constant: -3),
            totalWinsTitle.leadingAnchor.constraint(equalTo: totalWins.layoutMarginsGuide.leadingAnchor),
            totalWinsTitle.trailingAnchor.constraint(equalTo: totalWins.layoutMarginsGuide.trailingAnchor),
            
            totalWinsValue.topAnchor.constraint(equalTo: totalWins.centerYAnchor, constant: 3),
            totalWinsValue.leadingAnchor.constraint(equalTo: totalWins.layoutMarginsGuide.leadingAnchor),
            totalWinsValue.trailingAnchor.constraint(equalTo: totalWins.layoutMarginsGuide.trailingAnchor),
            
            // Profit
            profit.topAnchor.constraint(equalTo: totalLosses.bottomAnchor, constant: 24),
            profit.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            profit.heightAnchor.constraint(equalTo: totalWins.widthAnchor, multiplier: 0.5),
            profit.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -12),
            
            profitTitle.bottomAnchor.constraint(equalTo: profit.centerYAnchor, constant: -3),
            profitTitle.leadingAnchor.constraint(equalTo: profit.layoutMarginsGuide.leadingAnchor),
            profitTitle.trailingAnchor.constraint(equalTo: profit.layoutMarginsGuide.trailingAnchor),
            
            profitValue.topAnchor.constraint(equalTo: profit.centerYAnchor, constant: 3),
            profitValue.leadingAnchor.constraint(equalTo: profit.layoutMarginsGuide.leadingAnchor),
            profitValue.trailingAnchor.constraint(equalTo: profit.layoutMarginsGuide.trailingAnchor),
            
        ])
    }
}

