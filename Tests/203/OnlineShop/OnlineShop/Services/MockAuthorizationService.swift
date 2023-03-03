//
//  MockAuthorizationService.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import Foundation
import Combine

class MockAuthorizationService: AuthorizationService {
    static let shared: MockAuthorizationService = .init()

    private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(false)

    var isAuthorized: AnyPublisher<Bool, Never> {
        _isAuthorized
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    var signedInCredentials: (String, String)?

    func signIn(login: String, password: String) async throws {
        signedInCredentials = (login, password)
        if login == "admin" && password == "qwerty" {
            _isAuthorized.value = true
        } else if login == "123" && password == "123" {
            throw AuthorizationError.confirmationRequired
        } else {
            _isAuthorized.value = false
            throw AuthorizationError.unauthorized
        }
    }

    func confirmSignIn() async {
        _isAuthorized.value = true
    }

    func signOut() {
        _isAuthorized.value = false
    }
}
