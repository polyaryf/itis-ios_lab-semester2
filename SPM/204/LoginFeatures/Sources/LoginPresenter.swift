//
//  LoginPresenter.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import Macaroni
import UIKit
import Services

@available(iOS 16.0, *)
public class LoginPresenter {
    init(view: LoginView, confirmSignIn: @escaping () -> Void) {
        self.view = view
        self.confirmSignIn = confirmSignIn
    }

    @Injected
    public var authorizationService: AuthorizationService
    private weak var view: LoginView?
    private var confirmSignIn: () -> Void = {}

    @MainActor
    func logIn(login: String, password: String) async {
        view?.showLoader()
        do {
            try await authorizationService.signIn(login: login, password: password)
            view?.hideLoader()
        } catch AuthorizationError.confirmationRequired {
            confirmSignIn()
            view?.hideLoader()
        } catch {
            view?.show(error: error)
            view?.hideLoader()
        }
    }
}
