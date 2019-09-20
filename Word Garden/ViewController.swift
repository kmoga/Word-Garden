//
//  ViewController.swift
//  Word Garden
//
//  Created by SBAUser on 9/17/19.
//  Copyright © 2019 Kyle Moga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var guessedLetterField: UITextField!
    
    @IBOutlet weak var guessLetterButton: UIButton!
    
    @IBOutlet weak var guessCountLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var flowerImageView: UIImageView!
    
//Variables
    var wordToGuess = "SWIFT"
    var lettersGuessed = ""
    let maxNumberOfWrongGuesses = 10
    var wrongGuessesRemaining = 10
    var guessCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessLetterButton.isEnabled = false
        playAgainButton.isHidden = true
    }
    
    func updateafterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        lettersGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if lettersGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1

        //shows next flowr image and shows decrements of wrong guesses
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
   
        let revealedWord = userGuessLabel.text!
        
// stop game if wrong guesses = 0
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "So sorry, you're all out of guesses. Try again?"
        } else if !revealedWord.contains("_") {
            //You've won a game!!
            playAgainButton.isHidden = true
            guessedLetterField.isEnabled = true
            guessLetterButton.isEnabled = false
            guessCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            //Update Guess Count
            let guess = (guessCount == 1 ? "Guess" : "Guesses")
            guessCountLabel.text = "You've made \(guessCount) \(guess)"
            
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        guessALetter()
        updateafterGuess()
    }

    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateafterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower9")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        lettersGuessed = ""
        formatUserGuessLabel()
        guessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        if let letterGuessed = guessedLetterField.text?.last {
           guessedLetterField.text = "\(letterGuessed)"
            guessLetterButton.isEnabled = true
        } else {
            //disable the button if i dont have a character in the Guessed Letter Field
            guessLetterButton.isEnabled = false
    }
    
}

}
