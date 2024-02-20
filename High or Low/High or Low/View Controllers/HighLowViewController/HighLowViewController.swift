//
//  HighLowViewController.swift
//  High or Low
//
//  Created by Kin+Carta on 16.2.24.
//

import UIKit

class HighLowViewController: UIViewController {
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
        label.text = "BET500"
        label.font = UIFont.systemFont(ofSize: 22)
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
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "$ \(userOne.moneyAmount)"
        return label
    }()
    
    let holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .primaryColor
        view.layer.cornerRadius = 15
        return view
    }()
    let card: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    let higherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "HIGHER"), for: .normal)
        button.setTitle("Higher", for: .normal)
        button.layer.cornerRadius = 5
        
        return button
    }()
    let lowerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "LOWER"), for: .normal)
        button.setTitle("Lower", for: .normal)
        button.layer.cornerRadius = 5
        
        return button
    }()
    let profitHolder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    let totalProfitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Profit (1.00x)"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .textColor
        return label
    }()
    let profitHolderTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 5
        return view
    }()
    let profitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.000000"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        return view
    }()
    let betAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bet Amount"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .textColor
        return label
    }()
    let betAmountView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.backgroundColor = .secondaryColor
        view.applyShadow()
        return view
    }()
    let betAmountTF: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .none
        textfield.keyboardType = .numberPad
        textfield.backgroundColor = .primaryColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.size.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = .always
        return textfield
    }()
    let halfbetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1/2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.backgroundColor = .secondaryColor
        return button
    }()
    let maxbetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Max", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.backgroundColor = .secondaryColor
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return button
    }()
    let betButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Bet", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.backgroundColor, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 0.00, green: 0.91, blue: 0.00, alpha: 1.00)
        return button
    }()
    
    // MARK: - Variables
    var wrongGuess: Bool = false
    var lastNumber: Int = 0
    var currentNumber: Int = 3
    var newNumber: Int = 0
    var higherGuess: Bool = true
    var multiplier: Double = 1.0
    var betAmount: Double =  0
    var isPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        appendElements()
        setupConstraints()
        getNewNumber()
        handleIsPlaying()
        
    }
}

extension UIView {
    func applyShadow() {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 4
        }
}
