//
//  ViewController.swift
//  SettingsUserDefaults
//
//  Created by user on 19.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var onOfLabel: UILabel!
    @IBOutlet var onOfSwitch: UISwitch!
    @IBOutlet var themeSegment: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    let onOfKey = "onOffKey"
    let themeKey = "themeKey"
    let darkTheme = "darkTheme"
    let lightTheme = "lightTheme"
    let redTheme = "redTheme"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchState()
        updateTheme()
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch themeSegment.selectedSegmentIndex {
        case 0:
            userDefaults.set(lightTheme, forKey: themeKey)
        case 1:
            userDefaults.set(darkTheme, forKey: themeKey)
        case 2:
            userDefaults.set(redTheme, forKey: themeKey)
        default:
            userDefaults.set(lightTheme, forKey: themeKey)
        }
        updateTheme()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if (onOfSwitch.isOn) {
            userDefaults.set(true, forKey: onOfKey)
            onOfLabel.text = "ON"
        } else {
            userDefaults.set(false, forKey: onOfKey)
            onOfLabel.text = "OFF"
        }
        
    }

    private func checkSwitchState() {
        if userDefaults.bool(forKey: onOfKey) {
            onOfSwitch.setOn(true, animated: false)
            onOfLabel.text = "ON"
        } else {
            onOfSwitch.setOn(false, animated: false)
            onOfLabel.text = "OFF"
        }
    }

    private func updateTheme() {
        let theme = userDefaults.string(forKey: themeKey)

        if theme == lightTheme {
            themeSegment.selectedSegmentIndex = 0
            view.backgroundColor = .white
        } else if theme == darkTheme {
            themeSegment.selectedSegmentIndex = 1
            view.backgroundColor = .gray
        } else if theme == redTheme {
            themeSegment.selectedSegmentIndex = 2
            view.backgroundColor = .red
        }
    }
}
