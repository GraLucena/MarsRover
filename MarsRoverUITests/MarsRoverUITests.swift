//
//  MarsRoverUITests.swift
//  MarsRoverUITests
//
//  Created by Graciela on 22/09/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import XCTest

class MarsRoverUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExecuteCommandsShowsPosition() {
        let app = XCUIApplication()
        let textField = app.textFields["commandsTextField"]
        let button = app.buttons["doneButton"]
        let label = app.staticTexts["resultLabel"]

        textField.tap()
        textField.typeText("FFF")
        app.buttons["Return"].tap()
        button.tap()

        XCTAssertEqual("5,8,north", label.label)
    }
}
