//
//  MockLoginView.swift
//  OnlineShopTests
//
//  Created by Teacher on 25.02.2023.
//

import Foundation
@testable import OnlineShop

class MockLoginView: LoginView {
    var showLoaderIsCalled: Bool = false
    var hideLoaderIsCalled: Bool = false
    var errorShown: Error?

    func showLoader() {
        showLoaderIsCalled = true
    }

    func hideLoader() {
        hideLoaderIsCalled = true
    }

    func show(error: Error) {
        errorShown = error
    }
}
