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
    
    func showProducts() {
        view?.list = catalogService.getAll()
    }
}
