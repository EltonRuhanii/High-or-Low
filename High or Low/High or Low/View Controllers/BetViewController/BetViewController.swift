//
//  BetViewController.swift
//  High or Low
//
//  Created by Kin+Carta on 30.1.24.
//

import UIKit

var userOne: UserModel = UserDatabase().userOne

class BetViewController: UIViewController {
    var newCardLeadingConstraint: NSLayoutConstraint!
    var newCardTrailingConstraint: NSLayoutConstraint!
    var lastCardLeadingConstraint: NSLayoutConstraint!
    var lastCardTrailingConstraint: NSLayoutConstraint!
    
     // MARK: - UI ELEMENTS
    let topView: UIView = {
         let view = createStyledView(cornerRadius: 0, borderWidth: 10, borderColor: UIColor.brown.cgColor)
         return view
     }()
    let moneyAmountLabel: UILabel = {
        let label = createLabel(text: "$ \(userOne.moneyAmount)", fontSize: 16, textColor: .white)
         return label
     }()
    let lastCard: UIView = createCardView(color: UIColor(named: "Red Gradient Start") ?? .red)
    let newCard: UIView = createCardView(color: UIColor(named: "Green Gradient End") ?? .green)
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let oneDollar: UIButton = createStyledButton(title: "$ 1", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
    let fiveDollars: UIButton = createStyledButton(title: "$ 5", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
    let tenDollars: UIButton = createStyledButton(title: "$ 10", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
    let twentyDollars: UIButton = createStyledButton(title: "$ 20", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
    let fiftyDollars: UIButton = createStyledButton(title: "$ 50", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
    let hundredDollars: UIButton = createStyledButton(title: "$ 100", backgroundColor: UIColor(named: "Green Gradient Start") ?? .green)
    
    
    // MARK: - VARIABLES
    var corners: CGFloat = 0.0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        corners = self.view.frame.width / 2
        setupUIElements()
        setupButtons()
    }
}
