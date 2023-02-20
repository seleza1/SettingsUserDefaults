//
//  ViewController.swift
//  SettingsUserDefaults
//
//  Created by user on 19.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet private var onOfLabel: UILabel!
    @IBOutlet private var onOfSwitch: UISwitch!
    @IBOutlet private var themeSegment: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchState()
        updateTheme()
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch themeSegment.selectedSegmentIndex {
        case 0:
            userDefaults.set(UserDefaultsKeys.lightTheme, forKey: UserDefaultsKeys.themeKey)
        case 1:
            userDefaults.set(UserDefaultsKeys.darkTheme, forKey: UserDefaultsKeys.themeKey)
        case 2:
            userDefaults.set(UserDefaultsKeys.redTheme, forKey: UserDefaultsKeys.themeKey)
        default:
            userDefaults.set(UserDefaultsKeys.lightTheme, forKey: UserDefaultsKeys.themeKey)
        }
        updateTheme()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if (onOfSwitch.isOn) {
            userDefaults.set(true, forKey: UserDefaultsKeys.onOfKey)
            onOfLabel.text = "ON"
        } else {
            userDefaults.set(false, forKey: UserDefaultsKeys.onOfKey)
            onOfLabel.text = "OFF"
        }
    }

    private func checkSwitchState() {
        if userDefaults.bool(forKey: UserDefaultsKeys.onOfKey) {
            onOfSwitch.setOn(true, animated: false)
            onOfLabel.text = "ON"
        } else {
            onOfSwitch.setOn(false, animated: false)
            onOfLabel.text = "OFF"
        }
    }

    private func updateTheme() {
        let theme = userDefaults.string(forKey: UserDefaultsKeys.themeKey)

        if theme == UserDefaultsKeys.lightTheme {
            themeSegment.selectedSegmentIndex = 0
            view.backgroundColor = .white
        } else if theme == UserDefaultsKeys.darkTheme {
            themeSegment.selectedSegmentIndex = 1
            view.backgroundColor = .gray
        } else if theme == UserDefaultsKeys.redTheme {
            themeSegment.selectedSegmentIndex = 2
            view.backgroundColor = .blue
        }
    }
}
