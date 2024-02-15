//
//  LoginViewController+HelperFunction.swift
//  High or Low
//
//  Created by Kin+Carta on 15.2.24.
//

import UIKit
/*
extension LoginViewController {
    func makeTextFieldView(placeholder: String, topAnchor: NSLayoutYAxisAnchor, leadingAnchor: NSLayoutXAxisAnchor, trailingAnchor: NSLayoutXAxisAnchor, heightConstant: CGFloat) -> UIView {
        let textFieldView = UIView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.backgroundColor = .clear
        textFieldView.layer.borderColor = UIColor.gray.cgColor
        textFieldView.layer.borderWidth = 1
        textFieldView.layer.cornerRadius = 10
        
        let placeholderTextView = UIView()
        placeholderTextView.translatesAutoresizingMaskIntoConstraints = false
        placeholderTextView.backgroundColor = UIColor(named: "BackgroundC")
        
        let placeholderLabel = UILabel()
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.text = placeholder
        placeholderLabel.font = UIFont.systemFont(ofSize: 14)
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        
        textField.addTarget(self, action: #selector(textFieldDidChangeSelection(_:)), for: .editingChanged)
        
        placeholderTextView.addSubview(placeholderLabel)
        textFieldView.addSubview(placeholderTextView)
        textFieldView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: topAnchor),
            textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textFieldView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textFieldView.heightAnchor.constraint(equalToConstant: heightConstant),
            
            placeholderTextView.heightAnchor.constraint(equalToConstant: 10),
            placeholderTextView.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: -5),
            placeholderTextView.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 15),
            
            placeholderLabel.heightAnchor.constraint(equalToConstant: 10),
            placeholderLabel.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: -5),
            placeholderLabel.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 20),
            
            placeholderTextView.trailingAnchor.constraint(equalTo: placeholderLabel.trailingAnchor, constant: 5),
            
            textField.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 10),
            textField.trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor, constant: -10),
            textField.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -10),
        ])
        
        return textFieldView
    }

    @objc func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            updateTextfield(placeholderTextView: textField.superview?.subviews.first(where: { $0 is UIView }) as? UIView, testTextfield: textField)
        } else {
            reupdateTextfield(placeholderTextView: textField.superview?.subviews.first(where: { $0 is UIView }) as? UIView, testTextfield: textField)
        }
    }

    func updateTextfield(placeholderTextView: UIView?, testTextfield: UITextField) {
        UIView.animate(withDuration: 0.5) {
            placeholderTextView?.isHidden = true
            testTextfield.placeholder = placeholderTextView?.subviews.compactMap({ $0 as? UILabel }).first?.text
        }
    }

    func reupdateTextfield(placeholderTextView: UIView?, testTextfield: UITextField) {
        UIView.animate(withDuration: 0.5) {
            placeholderTextView?.isHidden = false
            testTextfield.placeholder = ""
        }
    }
}
*/
