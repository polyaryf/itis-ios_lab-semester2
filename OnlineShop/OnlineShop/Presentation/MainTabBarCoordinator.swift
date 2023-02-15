//
//  MainTabBarCoordinator.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 15.02.2023.
//

import UIKit

class MainTabBarCoordinator {
    weak var tabBarController: UITabBarController?
    
    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        self.tabBarController = tabBarController
        tabBarController.viewControllers = [
            shopping(),
            profile(),
        ]
        return tabBarController
    }
    
    private func shopping() -> UIViewController {
        let controller = CatalogViewController()
        controller.tabBarItem = .init(
            title: "Catalog",
            image: .init(systemName: "cart"),
            selectedImage: .init(systemName: "cart.fill")
        )
        return controller
    }
    
    private func profile() -> UIViewController {
        let controller = ProfileViewController()
        controller.tabBarItem = .init(
                title: "Profile",
                image: .init(systemName: "person.circle"),
                selectedImage: .init(systemName: "person.circle.fill")
        )
        return controller
    }
}
