//
//  MinesViewController.swift
//  High or Low
//
//  Created by EltonRuhani @Kin+Carta on 26.2.24.
//

import UIKit

class MinesViewController: UIViewController {
    let navbar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColor
        view.applyShadow()
        return view
    }()
    
    let viewFiller: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColor
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
    // MINES
    let holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .primaryColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MineCell.self, forCellWithReuseIdentifier: MineCell.identifier)
        
        
        return collectionView
    }()
    
    // BOTTOM VIEW
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
    
    var minesCount = 3
    var currentMines = 0
    var bombArray: [String] = []
    var isPlaying: Bool = false
    var betAmount = 0
    var multiplier: Double = 1.0
    var gemCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        view.backgroundColor = .backgroundColor
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        setupArray()
        print(bombArray.count)
        setupNavBar()
        setupUI()
        setupBottomView()
        print(bombArray)
    }
    
    func setupArray() {
        for _ in 0...24 {
            if currentMines == minesCount {
                bombArray.append("GEM")
            } else {
                let mine = Int(arc4random_uniform(2))
                if mine == 1 {
                    bombArray.append("BOMB")
                    currentMines += 1
                } else {
                    bombArray.append("GEM")
                }
            }
        }
    }
    
    func handleLoss() {
        userOne.moneyAmount -= Double(betAmount)
    }
 
    func handleGame() {
        if !isPlaying {
            activateGame()
            showBottomPart()
        } else {
            betButton.setTitle("CASHOUT", for: .normal)
            
        }
    }
    
    func activateGame() {
        
    }
    
    func showBottomPart() {
        
    }
    
    func handleGuess(correct: Bool) {
        if correct {
            calculateMultiplier()
            updateLabel()
            gemCount += 1
            if gemCount - minesCount == 25 {
                print("END")
            }
        } else {
            print("WRONG")
        }
    }
    
    func updateLabel() {
        print("\(multiplier) x")
    }
    
    
    func calculateMultiplier() {
        switch gemCount {
        case 1:
            multiplier *= 1.13
        case 2:
            multiplier *= 1.29
        case 3:
            multiplier *= 1.48
        case 4:
            multiplier *= 1.71
        case 5:
            multiplier *= 2.00
        case 6:
            multiplier *= 2.35
        case 7:
            multiplier *= 2.79
        case 8:
            multiplier *= 3.35
        case 9:
            multiplier *= 4.07
        case 10:
            multiplier *= 5.00
        case 11:
            multiplier *= 6.26
        case 12:
            multiplier *= 7.96
        case 13:
            multiplier *= 9.25
        case 14:
            multiplier *= 13.80
        case 15:
            multiplier *= 18.97
        case 16:
            multiplier *= 27.11
        case 17:
            multiplier *= 40.66
        case 18:
            multiplier *= 65.06
        case 19:
            multiplier *= 89.02
        case 20:
            multiplier *= 112.69
        case 21:
            multiplier *= 143.05
        case 22:
            multiplier *= 175.05
        case 23:
            multiplier *= 225.23
        case 24:
            multiplier *= 265.52
        case 25:
            multiplier *= 289.00
        default: return
        }
    }
    
    
}

extension MinesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bombArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MineCell.identifier, for: indexPath) as? MineCell else {
            fatalError("Failed to dequeue Mine Cell in View Controller")
        }
        let image = self.bombArray[indexPath.row]
        cell.configure(with: UIImage(named: "\(image)") ?? UIImage(systemName: "questionmark")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 5
        return CGSize(width: width, height: width)
    }
    
}

class MineCell: UICollectionViewCell {
    static let identifier = "MineCell"
    
    private let holderView: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        view.largeContentImageInsets = .init(top: 50, left: 50, bottom: 50, right: 50)
        
        return view
    }()
    
    private let overlayButton: UIButton = {
        let bttn = UIButton()
        bttn.translatesAutoresizingMaskIntoConstraints = false
        bttn.backgroundColor = .secondaryColor
        bttn.layer.cornerRadius = 10
        return bttn
    }()
    
    public func configure(with image: UIImage) {
        self.holderView.setImage(image, for: .normal)
        self.setupUI()
    }
    
    func buttonPressed() {
        if holderView.currentImage == UIImage(named: "GEM") {
            
        } else {
            
        }
    }
    
    private func setupUI() {
        self.addSubview(holderView)
        self.addSubview(overlayButton)
        
        overlayButton.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
        holderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            holderView.topAnchor.constraint(equalTo: self.topAnchor),
            holderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            holderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            overlayButton.topAnchor.constraint(equalTo: self.topAnchor),
            overlayButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            overlayButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            overlayButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    @objc func buttonPressed(button: UIButton) {
        buttonPressed()
        UIView.animate(withDuration: 1, animations: {
            button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            button.layer.opacity = 0
        }) { (_) in
            UIView.animate(withDuration: 1) {
                button.transform = .identity
            }
        }
    }
    
}
