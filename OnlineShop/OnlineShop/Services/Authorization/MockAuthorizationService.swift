//
//  MockAuthorizationService.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 12.02.2023.
//

import Foundation
import Combine

class MockAuthorizationService: AuthorizationService {
    static let shared: MockAuthorizationService = .init()
    
    private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(false)
    
    var isAuthorized: AnyPublisher<Bool, Never> {
        _isAuthorized.eraseToAnyPublisher()
    }
    
    func signIn(login: String, password: String) async throws {
        try? await Task.sleep(for: .seconds(1))
        guard login == "Admin" else {
//             _isAuthorized.value = false
            throw AuthorizationError.wrongLoginOrPassword
        }
        guard password == "Qwerty" else {
            // _isAuthorized.value = false
            throw AuthorizationError.wrongLoginOrPassword
        }
        
        _isAuthorized.value = true
    }
    
    func signOut() {
        _isAuthorized.value = false
    }
}
    

