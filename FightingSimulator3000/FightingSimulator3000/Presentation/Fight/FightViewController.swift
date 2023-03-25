//
//  FightViewController.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import UIKit

class FightViewController: UIViewController {
    private var myHealthView: UIProgressView = {
        var progressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .green
        return progressView
    }()
    private var enemyHealthView: UIProgressView = {
        var progressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = .red
        return progressView
    }()
    private let basicAttackButton: UIButton = {
        var button: UIButton = .init(type: UIButton.ButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Basic attack", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(.none, action: #selector(basicAttackTap), for: .touchUpInside)
        return button
    }()
    private let magicAttackButton: UIButton = {
        var button: UIButton = .init(type: UIButton.ButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Magic attack", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .black
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(.none, action: #selector(magicAttackTap), for: .touchUpInside)
        return button
    }()
  
    var presenter: FightPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        myHealthView.progress = 1
        enemyHealthView.progress = 1
        view.addSubview(myHealthView)
        view.addSubview(enemyHealthView)
        view.addSubview(basicAttackButton)
        view.addSubview(magicAttackButton)
        
        guard let rightFighter = UIImageView.fromGif(
            frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)) ,
            resourceName: "rightFighter") else { return }
        view.addSubview(rightFighter)
        rightFighter.animationDuration = 1
        rightFighter.startAnimating()
        rightFighter.translatesAutoresizingMaskIntoConstraints = false
        
        guard let leftFighter = UIImageView.fromGif(
            frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)) ,
            resourceName: "leftFighter") else { return }
        view.addSubview(leftFighter)
        leftFighter.animationDuration = 3
        leftFighter.startAnimating()
        leftFighter.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myHealthView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            myHealthView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            myHealthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            enemyHealthView.topAnchor.constraint(equalTo: myHealthView.bottomAnchor, constant: 30),
            enemyHealthView.leadingAnchor.constraint(equalTo: myHealthView.leadingAnchor),
            enemyHealthView.trailingAnchor.constraint(equalTo: myHealthView.trailingAnchor),
            basicAttackButton.widthAnchor.constraint(equalToConstant: 150),
            basicAttackButton.topAnchor.constraint(equalTo: enemyHealthView.bottomAnchor, constant: 30),
            basicAttackButton.leadingAnchor.constraint(equalTo: myHealthView.leadingAnchor),
            magicAttackButton.topAnchor.constraint(equalTo: enemyHealthView.bottomAnchor, constant: 30),
            magicAttackButton.leadingAnchor.constraint(equalTo: basicAttackButton.trailingAnchor, constant: 30),
            magicAttackButton.widthAnchor.constraint(equalToConstant: 150),
            rightFighter.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            rightFighter.centerXAnchor.constraint(equalTo: magicAttackButton.centerXAnchor, constant: -25),
            rightFighter.widthAnchor.constraint(equalToConstant: 100),
            rightFighter.heightAnchor.constraint(equalToConstant: 100),
            leftFighter.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            leftFighter.centerXAnchor.constraint(equalTo: basicAttackButton.centerXAnchor),
            leftFighter.widthAnchor.constraint(equalToConstant: 100),
            leftFighter.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func setMyHealthViewProgress(value: Float) {
        myHealthView.progress = value
    }
    
    func setEnemyHealthViewProgress(value: Float) {
        enemyHealthView.progress = value
    }
    
    @objc
    private func basicAttackTap() {
        presenter?.showHealthPointsAfterBasicAttack()
    }
    
    @objc
    private func magicAttackTap() {
        presenter?.showHealthPointsAfterMagicAttack()
    }
}
