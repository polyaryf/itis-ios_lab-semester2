//
//  ShoppingFlowCoordinator.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 17.02.2023.
//

import UIKit

class ShoppingFlowCoordinator {
    static let shared: ShoppingFlowCoordinator = ShoppingFlowCoordinator()
   
    private weak var navController: UINavigationController?

    func start() -> UIViewController {
        let catalogViewController = CatalogViewController()
        let presenter = CatalogPresenter()
        presenter.showDetails = showDetail
        catalogViewController.presenter = presenter
        presenter.view = catalogViewController
        
        let navController = UINavigationController(rootViewController: catalogViewController)
        self.navController = navController
        return navController
    }
    
    func showDetail(for product: Product) {
        let detailViewConroller = DetailViewController()
        let detailPresenter = DetailPresenter()
        detailPresenter.view = detailViewConroller
        detailPresenter.showProduct(product: product)
        navController?.show(detailViewConroller, sender: .none)
    }
}


