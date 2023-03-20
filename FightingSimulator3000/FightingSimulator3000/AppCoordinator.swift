//
//  AppCoordinator.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import UIKit
import FightingServices
import FightingServicesImplementation
import PlayerServicesImplementation

class AppCoordinator {
    weak var window: UIWindow?
    public var fightService: FightService

    init(window: UIWindow? = nil, fightService: FightService) {
        self.window = window
        self.fightService = fightService
    }
    
    public static let shared: AppCoordinator = AppCoordinator(
        fightService: FightServiceImplementation (playerService: PlayerServiceImplementation())
    )
    
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
