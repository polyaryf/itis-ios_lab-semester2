//
//  AuthorizationServiceTests.swift
//  OnlineShopTests
//
//  Created by Полина Рыфтина on 03.03.2023.
//

import XCTest
@testable import OnlineShop

final class AuthorizationServiceTests: XCTestCase {
    var authorizationService: MockAuthorizationService!
    var loginView: MockLoginView!
    var confirmSignIn: () -> Void = {}
    
    
    @MainActor
    override func setUp() {
        authorizationService = MockAuthorizationService()
        loginView = MockLoginView()
        confirmSignIn = {}
    }
    
    func testConfirmSignInChangesIsAuthorizedValueCorrectly() async {
        let expectedResult = true
        
        await authorizationService.confirmSignIn()
        
        XCTAssertEqual(expectedResult, authorizationService.getIsAuthorizedValue())
    }
    
    func testSignOutChangesIsAuthorizedValueCorrectly() {
        let expectedResult = false
        
        authorizationService.signOut()
        
        XCTAssertEqual(expectedResult, authorizationService.getIsAuthorizedValue())
    }
}
    
