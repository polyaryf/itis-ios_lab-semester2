//
//  LoginViewController.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 13.02.2023.
//

import UIKit

class LoginViewController: UIViewController {
    private var activityIndicatorView: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    private var loginTextField: UITextField = {
        var textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        textField.textAlignment = .natural
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = false
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    private var passwordTextField: UITextField = {
        var textField: UITextField = .init()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.layer.borderColor = UIColor.systemBlue.cgColor
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
        button.backgroundColor = .systemBlue
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
        activityIndicatorView.startAnimating()
    }

    func hideLoader() {
        view.backgroundColor = .white
        activityIndicatorView.stopAnimating()
    }
    
    func show(error: Error) {
        let alertController = UIAlertController(
            title: "OOOPS",
            message: "Something went wrong: \(error)",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
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
        view.addSubview(activityIndicatorView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activityIndicatorView.topAnchor.constraint(equalTo: view.topAnchor),
            activityIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activityIndicatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
}
