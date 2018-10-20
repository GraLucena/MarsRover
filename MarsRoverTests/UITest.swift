//
//  UITest.swift
//  MarsRoverTests
//
//  Created by Graciela on 19/10/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import XCTest
@testable import MarsRover

class UITest: XCTestCase {

    var sut: ViewController!
    var presenter: PresenterMock!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        presenter = PresenterMock()
        sut.presenter = presenter
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testTextFieldHasChangeNotifiesPresenter() {
        let text = "Hola que tal?"
        _ = sut.view
        sut.commandsTextField.insertText(text)
        XCTAssertEqual(text, presenter.commandReceive)
    }

    class PresenterMock: ViewControllerPresenter {

        var commandReceive: String = ""
        override func commandHasChanged(_ command: String) {
            commandReceive = command
        }
    }
}
