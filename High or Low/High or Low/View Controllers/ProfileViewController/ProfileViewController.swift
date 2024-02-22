//
//  ProfileViewController.swift
//  High or Low
//
//  Created by Kin+Carta on 20.2.24.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        appendUIElements()
    }
    
    @objc func logoTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
