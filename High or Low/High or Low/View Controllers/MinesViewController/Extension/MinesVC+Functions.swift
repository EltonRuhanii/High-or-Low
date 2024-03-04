//
//  MinesVC.swift
//  High or Low
//
//  Created by Kin+Carta on 26.2.24.
//

import UIKit

extension MinesViewController {
    @objc func profileButtonPressed() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
