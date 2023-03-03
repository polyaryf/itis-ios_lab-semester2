//
//  DetailPresenter.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 18.02.2023.
//

import Foundation

class DetailPresenter {
    weak var view: DetailViewController?
    
    func showProduct(product: Product) {
        view?.set(name: product.name, price: product.price)
    }
}
