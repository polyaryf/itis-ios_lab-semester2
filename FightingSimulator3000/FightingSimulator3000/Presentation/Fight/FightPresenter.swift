//
//  FightPresenter.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import UIKit
import Combine

class FightPresenter {
    var fightService: FightService
    var showResult: (GameResult) -> Void = { _ in }
    
    weak var view: FightViewController?
    var cancellables: Set<AnyCancellable> = []
    
    init(fightService: FightService) {
        self.fightService = fightService
        fightService.enemyHealth.receive(on: DispatchQueue.main)
            .sink { [weak self] enemyHealth in
                guard let self else { return }
                
                if enemyHealth <= 0 {
                    self.showResult(GameResult.win)
                    return
                } else {
                    self.view?.setEnemyHealthViewProgress(value: Float(enemyHealth) / 100)
                }
               
            }.store(in: &cancellables)
        
        fightService.myHealth.receive(on: DispatchQueue.main)
            .sink { [weak self] myHealth in
                guard let self else { return }
                
                if myHealth <= 0 {
                    self.showResult(GameResult.lose)
                    return
                } else {
                    self.view?.setMyHealthViewProgress(value: Float(myHealth) / 100)
                }
            }.store(in: &cancellables)
    }
    
    func showHealthPointsAfterBasicAttack() {
        fightService.basicAttack()
    }
    
    func showHealthPointsAfterMagicAttack() {
        fightService.magicAttack()
    }
}
