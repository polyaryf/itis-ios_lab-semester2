//
//  MockCatalogService.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 15.02.2023.
//

import Foundation

class MockCatalogService: CatalogService {
    static let shared: MockCatalogService = MockCatalogService()

    var productsList: [Product] = [
        Product(name: "Milk", price: 60),
        Product(name: "Bread", price: 45),
        Product(name: "Dumplings", price: 300),
        Product(name: "Banana", price: 20),
        Product(name: "Tea", price: 100),
        Product(name: "Cookies", price: 90),
        Product(name: "Apple", price: 90),
        Product(name: "Salt", price: 42),
        Product(name: "Sugar", price: 60),
    ]
    
    func getAll() -> [Product] {
        return productsList
    }
    
    func add(product: Product) {
        productsList.append(product)
    }
}
