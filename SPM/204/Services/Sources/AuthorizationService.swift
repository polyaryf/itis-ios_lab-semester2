//
//  AuthorizationService.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import Foundation
import Combine

public enum AuthorizationError: Error {
    case unauthorized
    case confirmationRequired
}

@available(iOS 16.0, *)
public protocol AuthorizationService {
    var isAuthorized: AnyPublisher<Bool, Never> { get }

    func signIn(login: String, password: String) async throws
    func confirmSignIn() async
    func signOut()
}
