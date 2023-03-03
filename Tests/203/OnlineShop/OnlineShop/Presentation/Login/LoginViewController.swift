//
//  LoginViewController.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit

@MainActor
protocol LoginView: AnyObject {
    func showLoader()
    func hideLoader()
    func show(error: Error)
}

@MainActor
class LoginViewController: UIViewController, LoginView {
    @IBOutlet private var loginField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!

    var presenter: LoginPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    func showLoader() {
        view.backgroundColor = .systemGray
        activityIndicatorView.startAnimating()
    }

    func hideLoader() {
        view.backgroundColor = .white
        activityIndicatorView.stopAnimating()
    }

    func show(error: Error) {
        let alertController = UIAlertController(title: "OOOPS", message: "Something went wrong: \(error)", preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }

    @IBAction private func login() {
        Task {
            guard let login = loginField.text, let password = passwordField.text else { return }

            await presenter.logIn(login: login, password: password)
        }
    }
}
