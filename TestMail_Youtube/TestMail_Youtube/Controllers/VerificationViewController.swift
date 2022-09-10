//
//  ViewController.swift
//  TestMail_Youtube
//
//  Created by Арсентий Халимовский on 09.09.2022.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "glasses")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let statusLabel = StatusLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
        setDelegate()
        setConstraints()
    }
    
    private func setupViews() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
        
    }
    
    private func setDelegate() {
        
        
    }


}

extension VerificationViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
        
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        ])
    }
}
