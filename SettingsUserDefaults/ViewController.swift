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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchState()
    }
    
    func checkSwitchState() {
        if userDefaults.bool(forKey: onOfKey) {
            onOfSwitch.setOn(true, animated: false)
            onOfLabel.text = "ON"
        } else {
            onOfSwitch.setOn(false, animated: false)
            onOfLabel.text = "OFF"
        }
        
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {

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
    
}
