//
//  quizView.swift
//  Simple Kana
//
//  Created by Matthew Onghai on 5/27/19.
//  Copyright © 2019 Matthew Onghai. All rights reserved.
//

import Foundation
import UIKit

class quizView: UIViewController {
    
    let userData = UserDefaults.standard
    var inventory = kanaInventory()
    var kanaString = ""
    var pronunciationDict: [String: [String]] = [:]
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        // TODO: update the question label whenever the quiz tab is clicked
        constructPronunciationLibrary()
    }
    
    
    @IBAction func beginQuiz(_ sender: UIButton) {
        let kanaString = userData.string(forKey: "selectedKana")
        if let unwrappedKana = kanaString {
            // unwrappedKana is the unwrapped value
            if(unwrappedKana.count > 0) {
                inventory = kanaInventory(with: unwrappedKana)
                questionLabel.text = String(unwrappedKana.first!)
                sender.isHidden = true
                // TODO: Initialize the quiz
            } else {
                inventory = kanaInventory()
                questionLabel.text = " "
                createAlert(title: "Error", message: "Please Select Kana!")
            }
        }
    }
    
    
    func playQuiz(with inventory: kanaInventory) {
        // find this turn's kana value
        var currentKana = questionLabel.text // first case
        // find corresponding pronunciation text for this kana
        var answerArray = pronunciationDict[currentKana!]
        // use this to pull value from dictionary array
//        println(myDictionary["Hello"][0]) // Print 1
//        println(myDictionary["World"][0]) // Print 4
        
        
        // check answer
        for thisPronunciation in answerArray {
            // TODO: see if text input matches the pronunciation text
            
            // if so, update correct & wrong answer counts accordingly
            // remove that kana from the inventory if correct, leave in if incorrect
        }
        
        // TODO: quit button
            // if quit button is pressed, reset elements to state before "beginQuiz" can be called again.
    }
    
    // creates dictionary used to check valid pronunciations for a given kana
    func constructPronunciationLibrary() {
        pronunciationDict = ["あ": ["a"], "い": ["i"], "う": ["u"], "え": ["e"], "お": ["o"],
                             "か": ["ka"], "き": ["ki"], "く": ["ku"], "け": ["ke"], "こ": ["ko"],
                             "さ": ["sa"], "し": ["shi", "si"], "す": ["su"], "せ": ["se"], "そ": ["so"],
                             "た": ["ta"], "ち": ["chi"], "つ": ["tsu", "tu"], "て": ["te"], "と": ["to"],
                             "な": ["na"], "に": ["ni"], "ぬ": ["nu"], "ね": ["ne"], "の": ["no"],
                             "は": ["ha"], "ひ": ["hi"], "ふ": ["fu"], "へ": ["he"], "ほ": ["ho"],
                             "ま": ["ma"], "み": ["mi"], "む": ["mu"], "め": ["me"], "も": ["mo"],
                             "や": ["ya"], "ゆ": ["yu"], "よ": ["yo"], "ら": ["ra"], "り": ["ri"],
                             "る": ["ru"], "れ": ["re"], "ろ": ["ro"], "わ": ["wa"], "を": ["wo"], "ん": ["n", "nn"]]
    }
    
    
    // used to display error message for starting the quiz
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
