//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var hangman = HangmanPhrases()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let phrase: String = hangman.getRandomPhrase()
        // Generate a random phrase for the user to guess
        Phrase.text = hangman.updateDisplay(string: phrase)
    }

    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var Phrase: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var IncorrectGuessBox: UILabel!
    
    @IBOutlet weak var GuessBox: UILabel!
    
    @IBAction func letterWasPressed(_ sender: UIButton) {
        if !hangman.gameFreeze {
            GuessBox.text = "Guess: \(hangman.letters[sender.tag])"
            hangman.changeGuessedLetter(character: hangman.letters[sender.tag])
        }
    }

    @IBAction func guessWasPressed(_ sender: UIButton) {
        if !hangman.gameFreeze {
            Phrase.text = hangman.letterGuessed(character: hangman.letterGuessed)
            IncorrectGuessBox.text = "Incorrect Guesses: \(hangman.incorrectGuesses)"
            ImageView.image = UIImage(named: "hangman\(hangman.currentGuess)")
            if hangman.currentGuess == 7 {
                hangman.gameFreeze = true
                gameOverAlert()
            } else if hangman.phrase == hangman.display {
                hangman.gameFreeze = true
                winAlert()
            }
        }
    }
    
    @IBAction func startOverWasPressed(_ sender: UIBarButtonItem) {
        hangman.reset()
        Phrase.text = hangman.display
        ImageView.image = UIImage(named: "hangman\(hangman.currentGuess)")
        IncorrectGuessBox.text = "Incorrect Guesses: \(hangman.incorrectGuesses)"
    }
    
    @IBAction func newGameWasPressed(_ sender: UIBarButtonItem) {
        hangman.restart()
        let phrase: String = hangman.getRandomPhrase()
        // Generate a random phrase for the user to guess
        Phrase.text = hangman.updateDisplay(string: phrase)
        ImageView.image = UIImage(named: "hangman\(hangman.currentGuess)")
        IncorrectGuessBox.text = "Incorrect Guesses: \(hangman.incorrectGuesses)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func gameOverAlert() {
        let alertController = UIAlertController(title: "Game Over", message: "Rip AF", preferredStyle: .alert)
        
        // Create the actions
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        
        // Add the actions
        alertController.addAction(OKAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func winAlert() {
        let alertController = UIAlertController(title: "You Win!!", message: "You're cool", preferredStyle: .alert)
        
        // Create the actions
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        
        // Add the actions
        alertController.addAction(OKAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
}
