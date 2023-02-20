//
//  ViewController.swift
//  SettingsUserDefaults
//
//  Created by user on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var ofOnSwitch: UISwitch!
    @IBOutlet private var stepper: UIStepper!
    @IBOutlet private var labelCount: UILabel!


    let onOfKey = "onOfKey"
    let stepperKey = "stepperKey"
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSwitch()
        labelCount.text = userDefaults.string(forKey: stepperKey)
    }

    @IBAction func ofOnSwitchChange(_ sender: UISwitch) {
        if ofOnSwitch.isOn {
            userDefaults.set(true, forKey: onOfKey)
            view.backgroundColor = .gray
        } else {
            userDefaults.set(false, forKey: onOfKey)
            view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }

    }

    @IBAction func stepper(_ sender: UIStepper) {
        labelCount.text = "\(sender.value)"
        userDefaults.set(labelCount.text, forKey: stepperKey)

    }

    private func changeSwitch() {
        if userDefaults.bool(forKey: onOfKey) {
            view.backgroundColor = .gray
        } else {
            ofOnSwitch.setOn(false, animated: true)
            view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
    }

}
