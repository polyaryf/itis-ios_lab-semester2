//
//  AppConfigurator.swift.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 25.03.2023.
//

import Foundation
import FightingServicesImplementation
import PlayerServicesImplementation
import PlayerServices
import FightingServices

class AppConfigurator {    
    func configure() -> ServiceLocator {
        let locator = ServiceLocator()
        let playerService: PlayerService = PlayerServiceImplementation()
        let fightService: FightService = FightServiceImplementation(playerService: playerService)
        locator.register { () -> FightService in
            fightService
        }
        return locator
    }
}
