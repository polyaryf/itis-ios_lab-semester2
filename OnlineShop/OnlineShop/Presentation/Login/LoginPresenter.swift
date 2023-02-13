//
//  LoginPresenter.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 13.02.2023.
//

import UIKit

class LoginPresenter {
    var authorizationService: AuthorizationService = MockAuthorizationService.shared
    
    weak var view: LoginViewController?
    
    @MainActor
    func logIn(login: String, password: String) {
        view?.showLoader()
        Task {
            do {
                try await authorizationService.signIn(login: login, password: password)
                view?.hideLoader()
            } catch {
                view?.show(error: error)
                view?.hideLoader()
            }
        }
    }
}
