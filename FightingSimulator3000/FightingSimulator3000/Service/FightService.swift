//
//  FightService.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import Combine
import Foundation

protocol FightService {
    var myHealth: AnyPublisher<Int, Never> { get }
    var enemyHealth: AnyPublisher<Int, Never> { get }
    /// Restores player and enemy health to 100
    func startFight()
    /// Deals 9 damage to enemy. Enemy attacks back and reduces `myHealth` by 10.
    func basicAttack()
    /// Deals 7-15 damage. Enemy attacks back and reduces `myHealth` by 10.
    func magicAttack()
}

class FightServiceImplementation: FightService {
    static let shared: FightServiceImplementation = FightServiceImplementation()
    
    var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }
    
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)
    
    func startFight() {
        _myHealth.value = 100
        _enemyHealth.value = 100
    }

    func basicAttack() {
        _myHealth.value -= 10
        _enemyHealth.value -= 9
    }

    func magicAttack() {
        _myHealth.value -= 10
        _enemyHealth.value -= Int.random(in: 7...15)
    }
}

