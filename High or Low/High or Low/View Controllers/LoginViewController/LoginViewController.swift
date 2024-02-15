//
//  LoginViewController.swift
//  High or Low
//
//  Created by Kin+Carta on 14.2.24.
//

import UIKit

let vSpacing: CGFloat = 12 // This can be used everywhere we have a standard Vertical Spacing
let hSpacing: CGFloat = 24 // This can be used everywhere we have a standard Horizontal Spacing
class LoginViewController: UIViewController, UITextFieldDelegate {
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    let logoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LOGO"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        return label
    }()
    let usernameTextfieldView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            view.layer.borderColor = UIColor.gray.cgColor
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
            
            return view
        }()
        
        let usernamePlaceholderTextView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(named: "BackgroundC")
            
            
            return view
        }()
        
        let usernamePlaceholderText: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Username"
            label.font = UIFont.systemFont(ofSize: 14)
            
            return label
        }()
        
        let usernameTextField: UITextField = {
            let textfield = UITextField()
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.borderStyle = .none
            return textfield
        }()
    
    //Password text field
    let passwordTextfieldView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .clear
            view.layer.borderColor = UIColor.gray.cgColor
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
            
            return view
        }()
        
        let passwordPlaceholderTextView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(named: "BackgroundC")
            
            
            return view
        }()
        
        let passwordPlaceholderText: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Password"
            label.font = UIFont.systemFont(ofSize: 14)
            
            return label
        }()
        
        let passwordTextField: UITextField = {
            let textfield = UITextField()
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.borderStyle = .none
            return textfield
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        setupUI()
        updateTextfield()
        while usernameTextField.text?.isEmpty == true {
            self.usernamePlaceholderTextView.isHidden = true
            self.usernameTextField.placeholder = "Username"
        }
        
        while passwordTextField.text?.isEmpty == true {
            self.passwordPlaceholderTextView.isHidden = true
            self.passwordTextField.placeholder = "Password"
        }
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(named: "BackgroundC")
        view.addSubview(topView)
        view.addSubview(logoLabel)
        view.addSubview(usernameTextfieldView)
        view.addSubview(usernamePlaceholderTextView)
        usernamePlaceholderTextView.addSubview(usernamePlaceholderText)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextfieldView)
        view.addSubview(passwordPlaceholderTextView)
        passwordPlaceholderTextView.addSubview(passwordPlaceholderText)
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            logoLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            logoLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            usernameTextfieldView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: vSpacing),
            usernameTextfieldView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            usernameTextfieldView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            usernameTextfieldView.heightAnchor.constraint(equalToConstant: 60),
            
            usernamePlaceholderTextView.heightAnchor.constraint(equalToConstant: 10),
            usernamePlaceholderTextView.topAnchor.constraint(equalTo: usernameTextfieldView.topAnchor, constant: -5),
            usernamePlaceholderTextView.leadingAnchor.constraint(equalTo: usernameTextfieldView.leadingAnchor, constant: 15),
            
            usernamePlaceholderText.heightAnchor.constraint(equalToConstant: 10),
            usernamePlaceholderText.topAnchor.constraint(equalTo: usernameTextfieldView.topAnchor, constant: -5),
            usernamePlaceholderText.leadingAnchor.constraint(equalTo: usernameTextfieldView.leadingAnchor, constant: 20),
            
            usernamePlaceholderTextView.trailingAnchor.constraint(equalTo: usernamePlaceholderText.trailingAnchor, constant: 5),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameTextfieldView.topAnchor, constant: 10),
            usernameTextField.leadingAnchor.constraint(equalTo: usernameTextfieldView.leadingAnchor, constant: 10),
            usernameTextField.trailingAnchor.constraint(equalTo: usernameTextfieldView.trailingAnchor, constant: -10),
            usernameTextField.bottomAnchor.constraint(equalTo: usernameTextfieldView.bottomAnchor, constant: -10),
            
            passwordTextfieldView.topAnchor.constraint(equalTo: usernameTextfieldView.bottomAnchor, constant: 24),
            passwordTextfieldView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            passwordTextfieldView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            passwordTextfieldView.heightAnchor.constraint(equalToConstant: 60),
            
            passwordPlaceholderTextView.heightAnchor.constraint(equalToConstant: 10),
            passwordPlaceholderTextView.topAnchor.constraint(equalTo: passwordTextfieldView.topAnchor, constant: -5),
            passwordPlaceholderTextView.leadingAnchor.constraint(equalTo: passwordTextfieldView.leadingAnchor, constant: 15),
            
            passwordPlaceholderText.heightAnchor.constraint(equalToConstant: 10),
            passwordPlaceholderText.topAnchor.constraint(equalTo: passwordTextfieldView.topAnchor, constant: -5),
            passwordPlaceholderText.leadingAnchor.constraint(equalTo: passwordTextfieldView.leadingAnchor, constant: 20),
            
            passwordPlaceholderTextView.trailingAnchor.constraint(equalTo: passwordPlaceholderText.trailingAnchor, constant: 5),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextfieldView.topAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextfieldView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextfieldView.trailingAnchor, constant: -10),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextfieldView.bottomAnchor, constant: -10),
        ])
    }

//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        if usernameTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true {
//            updateTextfield()
//        } else {
//            reupdateTextfield()
//        }
//    }
    
    
        
    func updateTextfield() {
        if usernameTextField.text?.isEmpty ?? true {
            UIView.animate(withDuration: 0.5) {
                self.usernamePlaceholderTextView.isHidden = true
                self.usernameTextField.placeholder = "Username"
            }
        } else if passwordTextField.text?.isEmpty ?? true {
            UIView.animate(withDuration: 0.5) {
                self.passwordPlaceholderTextView.isHidden = true
                self.passwordTextField.placeholder = "Password"
            }
        }
    }
        
    func reupdateTextfield() {
        if usernameTextField.text?.isEmpty == false {
            UIView.animate(withDuration: 0.5) {
                self.usernamePlaceholderTextView.isHidden = true
                self.usernameTextField.placeholder = "Username"
            }
        } else if passwordTextField.text?.isEmpty == false {
            UIView.animate(withDuration: 0.5) {
                self.passwordPlaceholderTextView.isHidden = true
                self.passwordTextField.placeholder = "Password"
            }
        }
    }
}
