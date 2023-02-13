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
        guard login == "Admin" else {
            _isAuthorized.value = false
            throw AuthorizationError.wrongLogin
        }
        guard password == "Qwerty" else {
            _isAuthorized.value = false
            throw AuthorizationError.wrongPassword
        }
        
        _isAuthorized.value = true
       
            
    }
}
    

