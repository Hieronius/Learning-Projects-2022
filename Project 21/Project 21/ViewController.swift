//
//  ViewController.swift
//  Project 21
//
//  Created by Арсентий Халимовский on 07.01.2023.
//

import UserNotifications
import UIKit

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
    }

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
    
    @objc func scheduleLocal() {
        
        registerCategories()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Late wake up call"
        content.body = "The early bird catches the worm, but the second mouse gets the cheese."
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
    func registerCategories() {
        
        print("has been registered")
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let show = UNNotificationAction(identifier: "show", title: "Tell me more", options: .foreground)
        // another action
        let showSecond = UNNotificationAction(identifier: "later", title: "Remind me later", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show, showSecond], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        
        
        if let customData = userInfo["customData"] as? String {
            print("custom data received: \(customData)")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                // the user swiped to unlock
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    let ac = UIAlertController(title: "First window", message: "There is a default", preferredStyle: .alert)
                    
                    self.present(ac, animated: true)
                    print("default identifier")
                }
                
                
            case "show":
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    
                let ac = UIAlertController(title: "Second window", message: "Show controller", preferredStyle: .alert)
                    self.present(ac, animated: true)
                print("Show more information...")
                }
                
            case "later":
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.scheduleLocal()
                let ac = UIAlertController(title: "Thirth window", message: "Thirth controller", preferredStyle: .alert)
                    self.present(ac, animated: true)
                print("Notification was extended")
                }
                
            default:
                break
            }
        }
        
        completionHandler()
    }
}

