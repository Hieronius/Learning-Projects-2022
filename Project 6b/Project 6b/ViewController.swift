//
//  ViewController.swift
//  Project 6b
//
//  Created by Арсентий Халимовский on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var orientationPositionCounter = 0
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        orientationPositionCounter += 1
        
        if orientationPositionCounter == 3 {
            orientationPositionCounter = 0
        }
        print(orientationPositionCounter)
//        print(UIDevice.current.orientation)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "THESE"
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        while true {
        if orientationPositionCounter == 0 {
            
            var previous: UILabel?
            
            
            let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top
            let bottomPadding = window?.safeAreaInsets.bottom
            
            
            
            let viewHeight = self.view.frame.size.height
            let totalViewHeight = viewHeight - (topPadding! + bottomPadding!)
            print(viewHeight)

            
            for label in [label1, label2, label3, label4, label5] {
                label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
                label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
                 label.heightAnchor.constraint(equalToConstant: totalViewHeight/5 - 10).isActive = true
                 //label.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
                // label.heightAnchor.constraint(greaterThanOrEqualToConstant: 68).isActive = true
                
                if let previous = previous {
                    label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
                } else {
                    label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                }
                
                previous = label
        }
        } else {
            
            
            var previous: UILabel?
            
            
            let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top
            let bottomPadding = window?.safeAreaInsets.bottom
            
            
            let viewHeight = self.view.frame.size.height
            let totalViewHeight = viewHeight - (topPadding! + bottomPadding!)
            print(viewHeight)

            
            for label in [label1, label2, label3, label4, label5] {
                label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
                label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
                 label.heightAnchor.constraint(equalToConstant: totalViewHeight/5 - 10).isActive = true
                 //label.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
                // label.heightAnchor.constraint(greaterThanOrEqualToConstant: 68).isActive = true
                
                if let previous = previous {
                    label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
                } else {
                    label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                }
                
                previous = label
        }
    }
        }
    

}

}
