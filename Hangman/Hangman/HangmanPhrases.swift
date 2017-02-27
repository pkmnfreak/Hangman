//
//  HangmanPhrases.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import Foundation

class HangmanPhrases {
    
    var phrases : NSArray!
    var letters : [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var display = ""
    var firstDisplay = ""
    var phrase = ""
    var letterGuessed: Character = " "
    var incorrectGuesses = ""
    var currentGuess = 1
    var gameFreeze = false
    
    // Initialize HangmanPhrase with an array of all possible phrases of the Hangman game
    init() {
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)
    }
    
    // Get random phrase from all available phrases
    func getRandomPhrase() -> String {
        let index = Int(arc4random_uniform(UInt32(phrases.count)))
        return phrases.object(at: index) as! String
    }
    
    //Spaces out phrase so that display and phrase indices match
    func spaceOutPhrase(string: String) {
        for character in string.characters {
            phrase += String(character) + " "
        }
    }
    
    //Takes in phrase and creates initial display
    func updateDisplay(string: String) -> String {
        for character in string.characters {
            if String(character) == " " {
                display += "  "
            } else {
                display += "- "
            }
        }
        self.spaceOutPhrase(string: string)
        firstDisplay = display
        return display
    }
    
    //Store most recent letter pressed
    func changeGuessedLetter(character: Character) {
        letterGuessed = character
    }
    
    //Takes in character of letter pressed and updates display
    func letterGuessed(character: Character) -> String {
        print("User pressed \(character)")
        if !(incorrectGuesses.contains(String(character))) {
            if phrase.contains(String(character)){
                let arrayPhrase = Array(phrase.characters)
                var arrayDisplay = Array(display.characters)
                for i in 0 ..< arrayPhrase.count {
                    if arrayPhrase[i] == character {
                        arrayDisplay[i] = arrayPhrase[i]
                    }
                }
                display = String(arrayDisplay)
                return display
            } else {
                var arrayIncorrect = Array(incorrectGuesses.characters)
                arrayIncorrect.append(character)
                incorrectGuesses = String(arrayIncorrect)
                currentGuess += 1
                return display
            }
        }
        return display
    }
    
    func reset() {
        display = firstDisplay
        letterGuessed = " "
        incorrectGuesses = ""
        currentGuess = 1
        gameFreeze = false
    }
    
    func restart() {
        display = ""
        firstDisplay = ""
        phrase = ""
        letterGuessed = " "
        incorrectGuesses = ""
        currentGuess = 1
        gameFreeze = false
    }

}
