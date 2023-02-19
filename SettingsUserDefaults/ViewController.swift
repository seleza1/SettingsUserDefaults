//
//  ViewController.swift
//  SettingsUserDefaults
//
//  Created by user on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ofOnSwitch: UISwitch!
    let onOfKey = "onOfKey"
    let userDefaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSwitch()

    }

    @IBAction func ofOnSwitchChange(_ sender: UISwitch) {
        if ofOnSwitch.isOn {
            userDefaults.set(true, forKey: onOfKey)
            view.backgroundColor = .gray
        } else {
            userDefaults.set(false, forKey: onOfKey)
            view.backgroundColor = .blue

        }
    }

    private func changeSwitch() {
        if userDefaults.bool(forKey: onOfKey) {
            ofOnSwitch.setOn(true, animated: false)
            view.backgroundColor = .gray
        } else {
            ofOnSwitch.setOn(false, animated: true)
            view.backgroundColor = .blue

        }
    }
}
