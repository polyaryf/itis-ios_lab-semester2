//
//  ConfirmationController.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import UIKit

@available(iOS 16.0, *)
public class ConfirmationController: UIViewController {
    public var presenter: ConfirmationPresenter!

    @IBAction private func confirm() {
        presenter.confirm()
    }
}
