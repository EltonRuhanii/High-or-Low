//
//  HighLowViewController+CollectionView.swift
//  High or Low
//
//  Created by Kin+Carta on 22.2.24.
//

import UIKit

extension HighLowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCell.identifier, for: indexPath) as? CardsCell else {
            fatalError("Failed to dequeue Cards Cell in View Controller")
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
