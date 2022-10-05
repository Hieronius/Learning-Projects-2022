//
//  ViewController.swift
//  Project8
//
//  Created by Арсентий Халимовский on 28.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
    var attemptsLabel: UILabel!
    var letterButtons = [UIButton]()
    
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    
    var score = 0 {
        didSet {
            print("The score is \(score)")
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    var attempts = 3 {
        didSet {
            print("Your attempts now is \(attempts)")
            attemptsLabel.text = "Attempts: \(attempts)"
        }
    }// add observer here
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        createButtons()
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadLevel()
    }

    
    
    @objc func submitTapped(_ sender: UIButton) {
        guard let answerText = currentAnswer.text else { return }
        
        if let solutionPosition = solutions.firstIndex(of: answerText) {
            activatedButtons.removeAll()
            
            var splitAnswers = answersLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            answersLabel.text = splitAnswers?.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            
            if score % 7 == 0 {
                let ac = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "let's go", style: .default, handler: levelUp))
                present(ac, animated: true)
            }
        } else {
            attempts -= 1
            let ac = UIAlertController(title: "Wrong answer", message: "Plz, try again", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            
            if attempts == 0 {
                ac.addAction(UIAlertAction(title: "New game", style: .default) { action in
                    self.loadLevel()
                })
            }
            
            present(ac, animated: true)
        }
    
    }
    
}

