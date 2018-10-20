//
//  Rover.swift
//  MarsRover
//
//  Created by Graciela on 22/09/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import Foundation

enum Orientation: String {
    case north, south, east, west
}

enum Command: Character {
    case right = "R"
    case left = "L"
    case forward = "F"
}

class Rover: CustomStringConvertible {

    var description: String {
        return String(format: "%d,%d,%@", x, y, orientation.rawValue)
    }

    var orientation: Orientation = .north
    // swiftlint:disable identifier_name
    var x: Int = 5
    var y: Int = 5
    // swiftlint:enable identifier_name
    var obstacles: [Obstacle] = []

    func receive(command: String) {
        command.forEach { (char) in
            guard let command = Command(rawValue: char) else {return}
            switch command {
            case .right:
                turnRigth()
            case .left:
                turnLeft()
            case .forward:
                goForward()
            }
        }
    }

    private func turnRigth() {
        switch orientation {
        case .north:    orientation = .east
        case .east:     orientation = .south
        case .south:    orientation = .west
        case .west:     orientation = .north
        }
    }

    private func turnLeft() {
        switch orientation {
        case .north:    orientation = .west
        case .west:     orientation = .south
        case .south:    orientation = .east
        case .east:     orientation = .north
        }
    }

    private func goForward() {
        if !checkIfThereIsObstacleForward() {
            switch orientation {
            case .north: y += 1
            case .east:  x += 1
            case .south: y -= 1
            case .west:  x -= 1
            }
        }
    }

    private func checkIfThereIsObstacleForward() -> Bool {

        let futurePosition: (x: Int, y: Int)!
        switch orientation {
        case .north: futurePosition = (x: x, y: y+1)
        case .east:  futurePosition = (x: x+1, y: y)
        case .south: futurePosition = (x: x, y: y-1)
        case .west:  futurePosition = (x: x-1, y: y)
        }
        for obstacle in obstacles {
            if obstacle.y == futurePosition.y && obstacle.x == futurePosition.x {
                return true
            }
        }
        return false
    }
}
