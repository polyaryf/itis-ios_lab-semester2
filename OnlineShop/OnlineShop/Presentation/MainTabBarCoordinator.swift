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
        let presenter = CatalogPresenter()
        let navController = UINavigationController(rootViewController: controller)
        controller.presenter = presenter
        presenter.view = controller
        controller.tabBarItem = .init(
            title: "Catalog",
            image: .init(systemName: "cart"),
            selectedImage: .init(systemName: "cart.fill")
        )
        return navController
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
