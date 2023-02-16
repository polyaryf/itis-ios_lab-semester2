//
//  DetailViewController.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 15.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    private let imageView: UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "cart"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private var nameLabel: UILabel = {
        var label = UILabel.init()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var priceLabel: UILabel = {
        var label = UILabel.init()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 280),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
        ])
    }
    
    func set(name: String, price: Int) {
        nameLabel.text = "\(name)"
        priceLabel.text = "Price: \(price)"
    }
}
