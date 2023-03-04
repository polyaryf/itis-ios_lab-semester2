//
//  RestAuthorizationService.swift
//  OnlineShop
//
//  Created by Teacher on 18.02.2023.
//

import Foundation
import Combine

@available(iOS 16.0, *)
public class RestAuthorizationService: AuthorizationService {
    public static let shared: MockAuthorizationService = .init()

    private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(false)

    public var isAuthorized: AnyPublisher<Bool, Never> {
        _isAuthorized
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    @available(iOS 16.0, *)
    public func signIn(login: String, password: String) async throws {
        try? await Task.sleep(for: .seconds(1))
  
        if !(login == "admin" && password == "qwerty") {
            _isAuthorized.value = false
            throw AuthorizationError.unauthorized
        } else {
            _isAuthorized.value = true
        }
    }

    public func confirmSignIn() async {
        _isAuthorized.value = true
    }

    public func signOut() {
        _isAuthorized.value = false
    }
}
