//
//  ConfirmationPresenter.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import Foundation

class ConfirmationPresenter {
    init(authorizationService: AuthorizationService) {
        self.authorizationService = authorizationService
    }

    private let authorizationService: AuthorizationService

    func confirm() {
        Task {
            await authorizationService.confirmSignIn()
        }
    }
}
