//
//  HomeUITests.swift
//  MVVMCUITests
//
//  Created by Eric Yuan on 18/09/2018.
//  Copyright © 2018 appcode. All rights reserved.
//

import XCTest

final class HomeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testHomeScreenWithOneColumnPortrait() {
        app.buttons["skipOnboarding"].tap()
        XCUIDevice.shared.orientation = .portrait

        let collectionViewsQuery = app.collectionViews
        let firstCellPostion = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).frame.origin.y
        let secondCellPosition = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).frame.origin.y
        XCTAssertNotEqual(firstCellPostion, secondCellPosition)
    }

    func testHomeScreenWithOneColumnLandscape() {
        app.buttons["skipOnboarding"].tap()
        XCUIDevice.shared.orientation = .landscapeLeft

        let collectionViewsQuery = app.collectionViews
        let firstCellPostion = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).frame.origin.y
        let secondCellPosition = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).frame.origin.y
        XCTAssertEqual(firstCellPostion, secondCellPosition)
    }
}
