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
    var currentLevel: Int? {
        didSet {
            print("the current level is \(currentLevel)")
        }
    }
    
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
    }
    
    var levelIsLoaded = false
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        createButtons()
        print("button is created")
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         // loadLevel()
        performSelector(inBackground: #selector(loadLevel), with: nil)
        
        print("level is loaded")
        
        if levelIsLoaded {
            performSelector(onMainThread: #selector(createButtons), with: nil, waitUntilDone: false)
        } else {
            let ac = UIAlertController(title: "Error", message: "Data is not loaded", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            
            present(ac, animated: true)
        }
        
    }
    
    @objc override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // loadLevel()
    }
    
}

