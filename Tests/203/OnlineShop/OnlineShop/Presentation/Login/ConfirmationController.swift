//
//  ConfirmationController.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import UIKit

class ConfirmationController: UIViewController {
    var presenter: ConfirmationPresenter!

    @IBAction private func confirm() {
        presenter.confirm()
    }
}
