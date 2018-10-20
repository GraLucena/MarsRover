//
//  ViewControllerView.swift
//  MarsRover
//
//  Created by Graciela on 19/10/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import Foundation

protocol ViewControllerView {

    func showRoverPosition(_ position: String)
    func clearCommands()
    func enableDoneButton(_ enable: Bool)
}
