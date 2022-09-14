//
//  ViewController.swift
//  Project 2
//
//  Created by Арсентий Халимовский on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var counterOfQuestions = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuastion()
    }
    
    func askQuastion(action: UIAlertAction! = nil) {
        countries.shuffle() // it's shuffle the array
        correctAnswer = Int.random(in: 0...2) // it's take random number of element in 0-2 index and set it's as a right answer
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) PLAYER SCORE: \(score) QUESTIONS: \(counterOfQuestions)"
        counterOfQuestions += 1
        
        // And after new game it will make new random countries and correct answer
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong. It's \(countries[sender.tag]) flag"
            score -= 1
        }
        
        
        
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        
        if counterOfQuestions == 10 {
            ac.message = "Total score is \(score)"
            ac.addAction(UIAlertAction(title: "Start again", style: .default, handler: askQuastion))
            counterOfQuestions = 0
            score = 0
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuastion))
        }
        
        
        present(ac, animated: true)
                     
        }
     }
