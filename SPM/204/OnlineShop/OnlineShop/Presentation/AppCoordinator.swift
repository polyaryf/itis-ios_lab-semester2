//
//  AppCoordinator.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit
import Combine
import Macaroni
import Services
import LoginFeatures

@MainActor
class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()

    @Injected(.lazily)
    var authorizationService: AuthorizationService

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
        window?.rootViewController = SignInCoordinator(storyboard: UIStoryboard(name: "Main", bundle: nil)).start()
    }

    func showAppContent() {
        window?.rootViewController = MainTabBarCoordinator().start()
    }
}

