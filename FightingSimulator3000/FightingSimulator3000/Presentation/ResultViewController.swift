//
//  ResultViewController.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import UIKit

enum GameResult {
    case lose
    case win
}

class ResultViewController: UIViewController {
    private let resultLabel: UILabel = {
        var label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    private let restartButton: UIButton = {
        var button: UIButton = .init(type: UIButton.ButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Restart", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(.none, action: #selector(restartTap), for: .touchUpInside)
        return button
    }()
    
    var result: GameResult = .lose
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        view.backgroundColor = .black
        view.addSubview(resultLabel)
        view.addSubview(restartButton)
        
        setResultLabel()
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            restartButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            restartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            restartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
        ])
        
    }
    
    private func setResultLabel() {
        switch result {
            case .win:
                resultLabel.text = "You win!"
            case .lose:
                resultLabel.text = "You lose!"
        }
    }
    
    @objc
    private func restartTap() {
        AppCoordinator.shared.start()
    }
}
