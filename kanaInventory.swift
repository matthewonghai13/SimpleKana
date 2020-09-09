//
//  kanaInventory.swift
//  Simple Kana
//
//  Created by Matthew Onghai on 5/27/19.
//  Copyright © 2019 Matthew Onghai. All rights reserved.
//

import Foundation

class kanaInventory {
    // arrayList that is used to store the current testable kana
    
    var inventoryArray = [String]()
    
    // Init case when there are no currently selected kana at app launch
    init() {
        
    }
    
    // TODO: Init case where there were previously selected kana written to the database
    init(with kanaString: String) {
        // loop through the kanaString and add
        var charString = ""
        for thisChar in kanaString {
            charString = String(thisChar)
            add(kana: charString)
        }
        print("nondefault init called.")
    }

    // add the selected kana to the inventory
    func add(kana: String) {
        var isPresent = false;
        // check if passed in kana string is present in the inventory
        for thisKana in inventoryArray {
            if(kana == thisKana) {
                isPresent = true;
            }
        }
        // if it is not present, then add
        if(!isPresent) {
            inventoryArray.append(kana)
        }
    }
    
    // remove selected kana from the inventory
    func remove(kana: String) {
        for (index, thisKana) in inventoryArray.enumerated() {
            if(kana == thisKana) {
                inventoryArray.remove(at: index)
            }
        }
    }
    
    // print array to console for debugging
    func printArry() -> String {
        var str = ""
        for kana in inventoryArray {
            str += kana
        }
        print(str)
        return str
    }
}
