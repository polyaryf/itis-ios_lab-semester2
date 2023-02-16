//
//  CatalogService.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 15.02.2023.
//

import Foundation

protocol CatalogService {
    func getAll() -> [Product]
    func add(product: Product)
}
