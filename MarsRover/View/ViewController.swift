//
//  ViewController.swift
//  MarsRover
//
//  Created by Graciela on 22/09/2018.
//  Copyright © 2018 Graciela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var commandsTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Properties
    var presenter = ViewControllerPresenter()

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.viewIsReady()
        commandsTextField.delegate = self
    }

    // MARK: - IBActions
    @IBAction func onTextFieldChange(_ sender: UITextField) {
        presenter.commandHasChanged(sender.text ?? "")
    }

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        presenter.doneButtonHasPressed()
    }
}

// MARK: - ViewControllerView
extension ViewController: ViewControllerView {
    func showRoverPosition(_ position: String) {
        resultLabel.text = position
    }

    func clearCommands() {
        commandsTextField.text = ""
    }

    func enableDoneButton(_ enable: Bool) {
        doneButton.isEnabled = enable
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        commandsTextField.resignFirstResponder()
        return true
    }
}
