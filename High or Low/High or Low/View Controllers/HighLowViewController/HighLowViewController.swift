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
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
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
        label.text = "$ 250.00"
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
        label.text = "0.000000"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Variables
    var wrongGuess: Bool = false
    var lastNumber: Int = 0
    var currentNumber: Int = 3
    var newNumber: Int = 0
    var higherGuess: Bool = true
    var multiplier: Double = 1.0
    var betAmount: Double =  1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        appendElements()
        setupConstraints()
        getNewNumber()
        profitLabel.text = "Hello"
    }
    
}
