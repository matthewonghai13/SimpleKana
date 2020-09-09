//
//  kanaView.swift
//  Simple Kana
//
//  Created by Matthew Onghai on 5/27/19.
//  Copyright © 2019 Matthew Onghai. All rights reserved.
//

import Foundation
import UIKit

class kanaView: UIViewController {
    // TODO: whenever this inventory is updated, update inventory and save to the config file.
    // TODO: whenever the app is launched, populate arraylist with the already activated kana in config.
    
    var inventory = kanaInventory()
    let userData = UserDefaults.standard
    @IBOutlet var kanaButtons: [UIButton]!
    
    override func viewDidLoad() {
        // working with database
            // TODO: whenever the app is launched, populate arraylist with the already activated kana in config.
        let kanaString = initFromDefault(with: inventory)
        if(kanaString != "empty") {
            // reconstruct the kana inventory with the previously selected kana
            inventory = kanaInventory(with: kanaString)
            // change used kana back to green
            var thisKana = ""
            // loop through the kana to be enabled by default
            for char in kanaString {
                thisKana = String(char)
                // loop through button outlet and update matching buttons to green
                for button in kanaButtons {
                    let buttonTitle = button.currentTitle
                    if let unwrappedTitle = buttonTitle {
                        if(unwrappedTitle == thisKana) {
                            button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func kanaPressed(_ sender: UIButton) {
        let optString = sender.currentTitle // fetch optional string from UIButton
        if let pressedKana = optString {
            print(pressedKana) // unwrap and print string value
            
            // enable/disable the button and update the inventory
            if(sender.backgroundColor != #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)) {
                sender.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                inventory.add(kana: pressedKana)
            } else {
                sender.backgroundColor = #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998806119, alpha: 1)
                inventory.remove(kana: pressedKana)
            }
        }
        // whenever this inventory is updated, update inventory and save to the config file.
        writeToDefault(with: inventory)
        printDefault()
    }
    
    func writeToDefault(with dataSet: kanaInventory) {
        // given an inventory, write to defaults with printArry method
        userData.set(dataSet.printArry(), forKey: "selectedKana")
    }
    
    // returns saved kana string for population of the app, if no defaults, returns empty
    func initFromDefault(with dataSet: kanaInventory) -> String {
        let kanaString = userData.string(forKey: "selectedKana")
        
        if(kanaString != nil) {
            return kanaString!
        } else {
            return "empty"
        }
    }
    
    // prints defaults for debugging
    func printDefault() {
        let kanaString = userData.string(forKey: "selectedKana")
        
        if(kanaString != nil) {
            print("The UserDefaults saved: " + kanaString!)
        }
    }
    
}
