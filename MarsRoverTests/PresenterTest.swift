//
//  PresenterTest.swift
//  MarsRoverTests
//
//  Created by Graciela on 19/10/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import XCTest
@testable import MarsRover

class PresenterTest: XCTestCase {

    var sut: ViewControllerPresenter!
    var view: MockView!
    var rover: MockRover!

    override func setUp() {
        super.setUp()
        sut = ViewControllerPresenter()
        view = MockView()
        rover = MockRover()
        sut.view = view
    }

    override func tearDown() {
        sut = nil
        view = nil
        super.tearDown()
    }

    func testButtonDisableWhenCommandIsEmpty() {
        sut.commandHasChanged("")
        XCTAssertFalse(view.buttonStatus ?? true)
    }

    func testButtonEnableWhenCommandIsNotEmpty() {
        sut.commandHasChanged("Hola no estoy vacío")
        XCTAssertTrue(view.buttonStatus ?? false)
    }

    func testExecuteCommandShowStatus() {
        let text = "Holi"
        rover.expectedDescription = text
        sut.rover = rover
        sut.doneButtonHasPressed()
        XCTAssertEqual(text, view.status)
    }

    class MockView: ViewControllerView {

        var buttonStatus: Bool?
        var status: String?

        func showRoverPosition(_ position: String) {
            status = position
        }

        func clearCommands() {

        }

        func enableDoneButton(_ enable: Bool) {
            buttonStatus = enable
        }
    }

    class MockRover: Rover {

        var expectedDescription: String?
        override var description: String {
            return expectedDescription ?? ""
        }
        var commands: String?

        override func receive(command: String) {
            self.commands = command
        }
    }
}
