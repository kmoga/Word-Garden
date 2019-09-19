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
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateafterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }

    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        updateafterGuess()
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func guessLetterFieldChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateafterGuess()
    }
    
    
}

