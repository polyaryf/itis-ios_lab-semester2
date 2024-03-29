//
//  AuthorizationService.swift
//  OnlineShop
//
//  Created by Полина Рыфтина on 12.02.2023.
//

import Foundation
import Combine

enum AuthorizationError: Error {
    case wrongLoginOrPassword
    
}

protocol AuthorizationService {
    var isAuthorized: AnyPublisher<Bool, Never> { get }
    func signIn(login: String, password: String) async throws
    func signOut()
}

