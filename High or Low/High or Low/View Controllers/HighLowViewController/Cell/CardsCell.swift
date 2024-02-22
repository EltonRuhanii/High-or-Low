//
//  CardsCell.swift
//  High or Low
//
//  Created by Kin+Carta on 22.2.24.
//

import UIKit

class CardsCell: UICollectionViewCell {
    static let identifier = "CardsCell"
    
    private let cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
    }()
    
    public func configure(with image: UIImage) {
        self.cardImageView.image = image
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: self.topAnchor),
            cardImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
