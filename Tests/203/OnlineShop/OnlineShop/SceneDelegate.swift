//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)
        let coordinator: AppCoordinator = .shared

        #if TESTS
        let configurator = MockConfigurator()
        #else
        let configurator = RestConfigurator()
        #endif
        let services = configurator.configure()
        coordinator.services = services

        coordinator.window = window
        coordinator.start()
        window.makeKeyAndVisible()
        self.window = window
    }
}

