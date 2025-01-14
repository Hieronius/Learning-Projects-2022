//
//  ViewController.swift
//  Project 2
//
//  Created by Арсентий Халимовский on 13.09.2022.
//

import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openScore))
    }
    
    
    
    func askQuastion(action: UIAlertAction! = nil) {
        countries.shuffle() // it's shuffle the array
        correctAnswer = Int.random(in: 0...2) // it's take random number of element in 0-2 index and set it's as a right answer
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) PLAYER SCORE: \(score) QUESTIONS: \(counterOfQuestions)"
        counterOfQuestions += 1
        button1.transform = .identity
        button2.transform = .identity
        button3.transform = .identity
        
        // And after new game it will make new random countries and correct answer
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            sender.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            
        } else {
            title = "Wrong. It's \(countries[sender.tag]) flag"
            score -= 1
            sender.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
        
        
        
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        // sender.transform = .identity
        
        
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
    
    @IBAction func getAccess(_ sender: Any) {
        registerLocal()
    }
    
    @IBAction func setNotifications(_ sender: Any) {
        
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
            content.title = "Come back summoner"
            content.body = "It's been a while. Let's start a new game"
            content.categoryIdentifier = "alarm"
            content.userInfo = ["customData": "fizzbuzz"]
            content.sound = UNNotificationSound.default
        
            var dateComponents = DateComponents()
            dateComponents.hour = 10
            dateComponents.minute = 30
        //        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        
    }
    
    @objc func openScore() {
        let score = "The current score is \(score)"
        
        let vc = UIActivityViewController(activityItems: [score], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }



// get access to notifications
@objc func registerLocal() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if granted {
            print("Yay!")
        } else {
            print("D'oh!")
        }
    }
}
    
    func registerCategories() {
        
        print("Check here")
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more", options: .foreground)
        
        let category = UNNotificationCategory(identifier: "later", actions: [show], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // user swiped to unlock
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    let ac = UIAlertController(title: "Swiped", message: "The user swiped notification", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Ok", style: .default))
                    
                    self.present(ac, animated: true)
                }
                case "show":
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    
            
                    let ac = UIAlertController(title: "Pressed", message: "The user pressed the button", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Ok", style: .default))
                    
                    self.present(ac, animated: true)
                }
            default:
                break
                }
            }
        completionHandler()
        }
    }



