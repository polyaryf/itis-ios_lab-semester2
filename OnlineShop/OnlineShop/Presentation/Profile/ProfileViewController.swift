//
//  ProfileViewController.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 15.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    private var profilePhoto: UIImageView = {
        var imageView = UIImageView.init()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var loginLabel: UILabel = {
        var label = UILabel.init()
        label.text = "Admin"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var signOutButton: UIButton = {
        var button: UIButton = .init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign out", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    var authorizationService: AuthorizationService = MockAuthorizationService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        view.addSubview(profilePhoto)
        view.addSubview(loginLabel)
        view.addSubview(signOutButton)
    
        signOutButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        setupConstraints()
    }
    
    @objc func signOut() {
        authorizationService.signOut()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profilePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePhoto.widthAnchor.constraint(equalToConstant: 280),
            profilePhoto.heightAnchor.constraint(equalToConstant: 250),
            loginLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 10),
            loginLabel.leadingAnchor.constraint(equalTo: profilePhoto.leadingAnchor),
            loginLabel.trailingAnchor.constraint(equalTo: profilePhoto.trailingAnchor),
            signOutButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 300),
            signOutButton.leadingAnchor.constraint(equalTo: profilePhoto.leadingAnchor),
            signOutButton.trailingAnchor.constraint(equalTo: profilePhoto.trailingAnchor),
            
        ])
    }
}
