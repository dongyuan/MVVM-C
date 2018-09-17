//
//  MVVMCUITests.swift
//  MVVMCUITests
//
//  Created by Eric Yuan on 17/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import XCTest

final class OnboardingUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testOnboardingFlowTests() {
        let userNameTextField = app.textFields["userName"]
        userNameTextField.tap()
        userNameTextField.typeText("valid@email.com")

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("validpassword")
        app.buttons["authenticate"].tap()
    }

    func testSkipOnboardingFlowTests() {
        app.buttons["skipOnboarding"].tap()
    }
}
