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
        label.text = "Bet500"
        label.font = UIFont(name: "Medinah", size: 20)
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
        return label
    }()
    let profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.tintColor = .white
        return button
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
        button.layer.cornerRadius = 5
        
        return button
    }()
    let lowerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "LOWER"), for: .normal)
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
        label.text = "0.00"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .backgroundColor
        collectionView.layer.cornerRadius = 10
        collectionView.register(CardsCell.self, forCellWithReuseIdentifier: CardsCell.identifier)
        return collectionView
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
        button.titleLabel?.font = UIFont(name: "Fredoka-Bold", size: 12)
        button.backgroundColor = .secondaryColor
        return button
    }()
    let maxbetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2x", for: .normal)
        button.titleLabel?.font = UIFont(name: "Fredoka-Bold", size: 12)
        button.backgroundColor = .secondaryColor
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return button
    }()
    let betButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Bet", for: .normal)
        button.titleLabel?.font = UIFont(name: "Fredoka-Bold", size: 16)
        button.setTitleColor(.backgroundColor, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 0.00, green: 0.91, blue: 0.00, alpha: 1.00)
        return button
    }()
    
    let wonAlertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .primaryColor
        view.layer.borderColor = UIColor(red: 0.00, green: 0.91, blue: 0.00, alpha: 1.00).cgColor
        view.layer.borderWidth = 5
        return view
    }()
    let alertTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00x"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.00, green: 0.91, blue: 0.00, alpha: 1.00)
        label.font = UIFont(name: "Fredoka", size: 18)
        return label
    }()
    let alertCenter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondaryColor
        view.layer.cornerRadius = 2
        return view
    }()
    let alertSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$ 0.00000"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.00, green: 0.91, blue: 0.00, alpha: 1.00)
        label.font = UIFont(name: "Fredoka", size: 18)
        return label
    }()
    let tapGestureRecognizer = UILongPressGestureRecognizer()
    
    // MARK: - Model
    var probailty: [ProbailtyModel] = [
        ProbailtyModel(higher: 93, lower: 07),
        ProbailtyModel(higher: 86, lower: 14),
        ProbailtyModel(higher: 79, lower: 21),
        ProbailtyModel(higher: 72, lower: 28),
        ProbailtyModel(higher: 65, lower: 35),
        ProbailtyModel(higher: 58, lower: 42),
        ProbailtyModel(higher: 51, lower: 49),
        ProbailtyModel(higher: 44, lower: 56),
        ProbailtyModel(higher: 37, lower: 63),
        ProbailtyModel(higher: 30, lower: 70),
        ProbailtyModel(higher: 23, lower: 77),
        ProbailtyModel(higher: 15, lower: 85),
        ProbailtyModel(higher: 8, lower: 92),
    ]
    
    var cardsArray: [Int] = []
    
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
        self.hideKeyboardWhenTappedAround()
        wonAlertView.isHidden = true
        view.backgroundColor = .backgroundColor
        appendElements()
        setupConstraints()
        getNewNumber()
        handleIsPlaying()
        cardsArray = []
        collectionView.reloadData()
        tapGestureRecognizer.addTarget(self, action: #selector(screenTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension HighLowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCell.identifier, for: indexPath) as? CardsCell else {
            fatalError("Failed to dequeue CardsCell in View Controller")
        }
        
        let image = self.cardsArray[indexPath.row]
        cell.configure(with: UIImage(named: "\(image)") ?? UIImage(systemName: "questionmark")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = 70
        let width = 50
        return CGSize(width: width, height: height)
    }
}
