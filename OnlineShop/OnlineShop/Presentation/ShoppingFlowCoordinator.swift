//
//  ShoppingFlowCoordinator.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 17.02.2023.
//

import UIKit

class ShoppingFlowCoordinator {
    static let shared: ShoppingFlowCoordinator = ShoppingFlowCoordinator()
   
    var navController: UINavigationController?

    func start() -> UIViewController {
        let catalogViewController = CatalogViewController()
        let presenter = CatalogPresenter()
        catalogViewController.presenter = presenter
        presenter.view = catalogViewController
        
        navController = UINavigationController(rootViewController: catalogViewController)
        return navController!
    }
    
    func showDetail(for product: Product) {
        let detailViewConroller = DetailViewController()
        detailViewConroller.set(name: product.name, price: product.price)
        navController?.show(detailViewConroller, sender: .none)
    }
}


