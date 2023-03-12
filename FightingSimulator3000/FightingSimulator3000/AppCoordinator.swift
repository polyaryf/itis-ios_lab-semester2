//
//  AppCoordinator.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import UIKit

class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()
    
    var fightService: FightService = FightServiceImplementation.shared
    
    func start() {
        fightService.startFight()
        showFight()
    }
    
    private func showFight() {
        let controller: FightViewController = FightViewController()
        let presenter: FightPresenter = FightPresenter(fightService: fightService)
        controller.presenter = presenter
        presenter.view = controller
        presenter.showResult = showResult
        window?.rootViewController = controller
    }
    
    func showResult(result: GameResult) {
        let controller: ResultViewController = ResultViewController()
        controller.result = result
        window?.rootViewController = controller
    }
}
