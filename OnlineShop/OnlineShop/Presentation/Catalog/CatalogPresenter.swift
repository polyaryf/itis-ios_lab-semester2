//
//  CatalogPresenter.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 16.02.2023.
//

import UIKit

class CatalogPresenter {
    var catalogService: CatalogService = MockCatalogService.shared
    
    weak var view: CatalogViewController?
    
    func showDetails(for product: Product) {
        let detailVC = DetailViewController()
        detailVC.set(name: product.name, price: product.price)
        self.view?.navigationController?.show(detailVC, sender: .none)
    }
}
