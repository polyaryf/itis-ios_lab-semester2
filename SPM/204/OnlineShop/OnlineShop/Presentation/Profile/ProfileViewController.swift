//
//  ProfileViewController.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import Macaroni
import UIKit
import Services

class ProfileViewController: UIViewController {
    @Injected
    var authorizationService: AuthorizationService

    @IBAction private func signOut() {
        authorizationService.signOut()
    }
}
