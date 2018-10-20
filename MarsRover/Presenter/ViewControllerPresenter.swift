//
//  ViewControllerPresenter.swift
//  MarsRover
//
//  Created by Graciela on 19/10/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import Foundation

class ViewControllerPresenter {

    var view: ViewControllerView!
    var rover: Rover!
    var command: String = ""

    // MARK: - Events
    func viewIsReady() {
        rover = Rover()
        view.enableDoneButton(false)
    }

    func commandHasChanged(_ command: String) {
        self.command = command
        view.enableDoneButton(!command.isEmpty)
    }

    func doneButtonHasPressed() {
        rover.receive(command: command)
        view.showRoverPosition(rover.description)
        view.clearCommands()
    }
}
