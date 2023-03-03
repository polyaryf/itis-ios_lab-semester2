//
//  AppCoordinator.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit
import Combine

@MainActor
class AppCoordinator {
    weak var window: UIWindow?
    var services: ServiceLocator!
    static let shared: AppCoordinator = .init()

    lazy var authorizationService: AuthorizationService
        = services.resolve()

    var cancellables: Set<AnyCancellable> = []

    func start() {
        authorizationService.isAuthorized
            .receive(on: DispatchQueue.main)
            .sink { [weak self] authorized in
                guard let self else { return }

                if authorized {
                    self.showAppContent()
                } else {
                    self.showAuthorization()
                }
            }
            .store(in: &cancellables)
    }

    func showAuthorization() {
        let signInCoordinator = SignInCoordinator()
        signInCoordinator.services = services
        let controller = signInCoordinator.start()
        window?.rootViewController = controller
    }

    func showAppContent() {
        let tabBarCoordinator = MainTabBarCoordinator()
        tabBarCoordinator.services = services
        window?.rootViewController = tabBarCoordinator.start()
    }
}
