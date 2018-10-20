//
//  RoverTests.swift
//  MarsRoverTests
//
//  Created by Graciela on 22/09/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import XCTest
@testable import MarsRover

class RoverTests: XCTestCase {

    var sut: Rover!

    override func setUp() {
        sut = Rover()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSutIsNotNil() {
        XCTAssertNotNil(sut)
    }

    func testSutInitialOrientationIsNorth() {
        XCTAssertEqual(.north, sut.orientation)
    }

    func testSutInitialCoordinatesAreFiveFive() {
        XCTAssertEqual(5, sut.x)
        XCTAssertEqual(5, sut.y)
    }

    func testSutTurnsRightLooksEast() {
        sut.receive(command: generate(command: .right))
        XCTAssertEqual(.east, sut.orientation)
    }

    func testSutTurnsRightTwiceLooksSouth() {
        let command = generate(command: .right, .right)
        sut.receive(command: command)
        XCTAssertEqual(.south, sut.orientation)
    }

    func testSutTurnsRightThreeTimesLooksWest() {
        let command = generate(command: .right, .right, .right)
        sut.receive(command: command)
        XCTAssertEqual(.west, sut.orientation)
    }

    func testSutTurnsRightFourTimesLooksNorth() {
        let command = generate(command: .right, .right, .right, .right)
        sut.receive(command: command)
        XCTAssertEqual(.north, sut.orientation)
    }

    func testSutTurnsLeftLooksWest() {
        sut.receive(command: generate(command: .left))
        XCTAssertEqual(.west, sut.orientation)
    }

    func testSutTurnsLeftTwiceLooksSouth() {
        let command = generate(command: .left, .left)
        sut.receive(command: command)
        XCTAssertEqual(.south, sut.orientation)
    }

    func testSutTurnsLeftThreeTimesLooksEast() {
        let command = generate(command: .left, .left, .left)
        sut.receive(command: command)
        XCTAssertEqual(.east, sut.orientation)
    }

    func testSutTurnsLeftFourTimesLooksNorth() {
        let command = generate(command: .left, .left, .left, .left)
        sut.receive(command: command )
        XCTAssertEqual(.north, sut.orientation)
    }

    func testMoveForwardIncreaseYWhenOrientationIsNorth() {
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(6, sut.y)
    }

    func testMoveForwardIncreaseYWhenOrientationIsNorthAndGivenYAxe() {
        sut.y = 10
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(11, sut.y)
    }

    func testMoveForwardIncreaseXWhenOrientationIsEast() {
        sut.orientation = .east
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(6, sut.x)
    }

    func testMoveForwardIncreaseYWhenOrientationIsEastAndGivenXAxe() {
        sut.orientation = .east
        sut.x = 10
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(11, sut.x)
    }

    func testMoveForwardDecreaseYWhenOrientationIsSouth() {
        sut.orientation = .south
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(4, sut.y)
    }

    func testMoveForwardDecreaseYWhenOrientationIsSouthAndGivenYAxe() {
        sut.orientation = .south
        sut.y = 10
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(9, sut.y)
    }

    func testMoveForwardDecreaseXWhenOrientationIsWest() {
        sut.orientation = .west
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(4, sut.x)
    }

    func testMoveForwardDecreaseXWhenOrientationIsWestAndGivenYAxe() {
        sut.orientation = .west
        sut.x = 10
        sut.receive(command: generate(command: .forward))
        XCTAssertEqual(9, sut.x)
    }

    func testRoverMovesForwardAndDetectObstacle() {
        sut.obstacles = [Obstacle(x: 5, y: 6)]
        sut.receive(command: generate(command: .forward))

        XCTAssertEqual(5, sut.x)
        XCTAssertEqual(5, sut.y)

    }

    func testDescriptionReturnsCurrentPosition() {
        let currentPosition =  "5,5,north"
        let position = sut.description
        XCTAssertEqual(currentPosition, position)
    }

    func testDescriptionReturnsAlternatePosition() {
        let currentPosition =  "5,5,north"
        sut.x = 5
        sut.y = 5
        sut.orientation = .north
        let position = sut.description
        XCTAssertEqual(currentPosition, position)
    }

    private func generate(command: Command...) -> String {
        let commandsString = command.compactMap({ $0.rawValue })
        return String(commandsString)
    }
}
