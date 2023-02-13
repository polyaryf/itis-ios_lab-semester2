//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 12.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let coordinator: AppCoordinator = AppCoordinator.shared
        coordinator.window = window
        coordinator.start()
        self.window = window
        window.makeKeyAndVisible()
    }
}

