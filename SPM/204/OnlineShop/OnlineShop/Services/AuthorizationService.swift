//
//  AuthorizationService.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import Foundation
import Combine

enum AuthorizationError: Error {
    case unauthorized
    case confirmationRequired
}

protocol AuthorizationService {
    var isAuthorized: AnyPublisher<Bool, Never> { get }

    func signIn(login: String, password: String) async throws
    func confirmSignIn() async
    func signOut()
}
