//
//  OnlineShopUITests.swift
//  OnlineShopUITests
//
//  Created by Teacher on 25.02.2023.
//

import XCTest

final class OnlineShopUITests: XCTestCase {
    override func setUp() {
        let app = XCUIApplication()
        app.launch()
        self.app = app
    }

    var app: XCUIApplication!

    func testWrongLoginPassword() throws {
        let loginField = app.textFields["LoginField"].firstMatch
        let passwordField = app.textFields["Password"].firstMatch
        let signInButton = app.buttons["Log in"].firstMatch

        loginField.tap()
        loginField.typeText("123")
        passwordField.tap()
        passwordField.typeText("123")
        signInButton.tap()

        let alert = app.alerts["OOOPS"].firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 3))
    }

    func testCustomTest() {
        let app = XCUIApplication()
        let loginfieldTextField = app/*@START_MENU_TOKEN@*/.textFields["LoginField"]/*[[".textFields[\"Login\"]",".textFields[\"LoginField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        loginfieldTextField.tap()

        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        app.buttons["Log in"].tap()
        let alert = app.alerts["OOOPS"]
        _ = alert.waitForExistence(timeout: 1)
        alert.buttons["OK"].tap()

        XCTAssertFalse(alert.exists)
    }
}
