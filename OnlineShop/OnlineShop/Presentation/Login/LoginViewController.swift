//
//  LoginViewController.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 13.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    private var activityIndicatorView: UIActivityIndicatorView = .init()
    private var loginTextField: UITextField = {
        var textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        textField.textAlignment = .natural
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    private var passwordTextField: UITextField = {
        var textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    private var loginButton: UIButton = {
        var button: UIButton = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    var presenter: LoginPresenter?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func showLoader() {
        view.backgroundColor = .systemGray
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }

    func hideLoader() {
        view.backgroundColor = .white
        view.willRemoveSubview(activityIndicatorView)
        activityIndicatorView.stopAnimating()
    }
    
    func show(error: Error) {
        let alertController = UIAlertController(
            title: "OOOPS",
            message: "Something went wrong: \(error)",
            preferredStyle: .alert
        )
        alertController.addAction(.init(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
    
    @objc func login() {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        guard let presenter else { return }
        presenter.logIn(login: login, password: password)
    }
    
    func setup() {
        view.backgroundColor = .white
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let stackView: UIStackView = .init(arrangedSubviews: [
            loginTextField, passwordTextField
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        view.addSubview(loginButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        greatingGifSetup()
    }
    
    func greatingGifSetup() {
        guard let confettiImageView = UIImageView.fromGif(frame: view.frame, resourceName: "hello") else { return }
        view.addSubview(confettiImageView)
        confettiImageView.animationDuration = 7
        confettiImageView.startAnimating()

        confettiImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            confettiImageView.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            confettiImageView.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            confettiImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            confettiImageView.topAnchor.constraint(equalTo: loginButton.bottomAnchor),
        ])
    }
}
