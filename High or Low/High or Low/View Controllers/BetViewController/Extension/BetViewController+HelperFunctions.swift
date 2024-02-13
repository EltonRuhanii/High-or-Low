//
//  BetViewController+HelperFunctions.swift
//  High or Low
//
//  Created by Kin+Carta on 9.2.24.
//

import UIKit

extension BetViewController {
    static func createStyledView(cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: CGColor? = nil) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor
        return view
    }
    
    static func createLabel(text: String, fontSize: CGFloat, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textColor = textColor
        return label
    }
    
    static func createCardView(color: UIColor) -> UIView {
        let view = createStyledView(cornerRadius: 10)
        view.backgroundColor = color
        return view
    }
    
    static func createCardLabel() -> UILabel {
        let label = createLabel(text: "0", fontSize: 24, textColor: .white)
        return label
    }
    
    static func createStyledButton(title: String, backgroundColor: UIColor ) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
}
