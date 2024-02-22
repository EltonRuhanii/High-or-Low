//
//  UIView+Extension.swift
//  High or Low
//
//  Created by Kin+Carta on 21.2.24.
//

import Foundation
import UIKit

extension UIView {
    func applyShadow() {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 0, height: 4)
            layer.shadowRadius = 4
        }
}
