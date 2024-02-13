//
//  HomeViewController.swift
//  High or Low
//
//  Created by Elton Ruhani @Kin+Carta on 26.1.24.
//

import UIKit
import CoreData

class GameViewController: UIViewController {
    var newCardLeadingConstraint: NSLayoutConstraint!
    var newCardTrailingConstraint: NSLayoutConstraint!
    var lastCardLeadingConstraint: NSLayoutConstraint!
    var lastCardTrailingConstraint: NSLayoutConstraint!
    
     // UI Elements
    let topView: UIView = {
         let view = createStyledView(cornerRadius: 0, borderWidth: 10, borderColor: UIColor.brown.cgColor)
         return view
     }()
    let moneyAmountLabel: UILabel = {
         let label = createLabel(text: "$ 1234", fontSize: 16, textColor: .white)
         return label
     }()
    let lastCard: UIView = createCardView(color: UIColor(named: "Red Gradient Start") ?? .red)
    let newCard: UIView = createCardView(color: UIColor(named: "Green Gradient End") ?? .green)
    let lastCardLabel: UILabel = createCardLabel()
    let newCardLabel: UILabel = createCardLabel()
    let multiplierView: UIView = createStyledView(cornerRadius: 10)
    let multiplierLabel: UILabel = {
        let label = createLabel(text: "x 1", fontSize: 18, textColor: .white)
        label.textAlignment = .center
        return label
     }()
     
    let lowerButton: UIButton = createStyledButton(title: "LOWER", backgroundColor: UIColor(named: "Red Gradient Start") ?? .red)
    let higherButton: UIButton = createStyledButton(title: "HIGHER", backgroundColor: UIColor(named: "Green Gradient End") ?? .green)
    let cashoutButton: UIButton = createStyledButton(title: "CASHOUT", backgroundColor: UIColor(named: "Red Gradient Start") ?? .red)
    
    let blurView: UIVisualEffectView = {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blur.translatesAutoresizingMaskIntoConstraints = false
        blur.layer.opacity = 0.5
        return blur
    }()
    let alert: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    let alertIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "x.circle.fill")
        image.tintColor = .red
        
        return image
    }()
    let alertTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lost"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        
        return label
    }()
    let alertSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Unfortunatly you lost everything you had. Click the button below to get $ 100 for free, and try ur luck again"
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        
        return label
    }()
    let depositButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .red
        button.setTitle("Deposit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
     // Color assets
    let background = UIColor(named: "BackgroundC")
    let primary = UIColor(named: "PrimaryC")
    var corners: CGFloat = 0.0
    
    // MARK: - VARIABLES
    var lastNumber: Int = 0
    var currentNumber: Int = 0
    var newNumber: Int = 0
    var userGuess: String = ""
    var multiplier: Double = 1.0
    var betAmount: Double = 0
     
    var shuffled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        corners = self.view.frame.width / 2
        setupUI()
        setupUIElements()
        updateNewNumber()
        saveUserToCoreData(userModel: userOne)
    }  
    
    func saveUserToCoreData(userModel: UserModel) {
        let context = CoreDataStack.shared.managedObjectContext

        let userEntity = UsersInformation(context: context)
        
        userEntity.username = userModel.username
        userEntity.moneyAmount = userModel.moneyAmount
        userEntity.betsPlaced = Int32(userModel.betsPlaced)
        userEntity.betsWon = Int32(userModel.betsWon)
        userEntity.betsLost = Int32(userModel.betsLost)
        userEntity.profit = userModel.profit
        userEntity.moneyMadeLost = Double(userModel.moneyMadeLost)
        
        do {
            try context.save()
        } catch {
            print("Error saving user: \(error)")
        }
    }
 }
