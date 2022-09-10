

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has been implemented")
        
    }
    
    private func configure() {
        
        text = "Check your mail"
        textColor = .white
        font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

