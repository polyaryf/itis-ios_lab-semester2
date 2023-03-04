//
//  ConfirmationPresenter.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import Foundation
import Macaroni
import Services

@available(iOS 16.0, *)
public class ConfirmationPresenter {
    @Injected
    public var authorizationService: AuthorizationService

    public func confirm() {
        Task {
            await authorizationService.confirmSignIn()
        }
    }
}
