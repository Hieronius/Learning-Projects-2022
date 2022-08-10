

import UIKit

class MemoryViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var item: MemoryItem!
    
    var blankCounter = 0
    
    let visibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.black
        ]
    
    let invisibleText: [NSAttributedString.Key: Any] = [
        .font: UIFont(name: "Georgia", size: 28)!,
        .foregroundColor: UIColor.clear,
        .strikethroughStyle: 1,
        .strikethroughColor: UIColor.black
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(item != nil, "You must provide a memory item before trying to show this view controller")
        showText()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(wordsTapped))
        textView.addGestureRecognizer(tapRecognizer)
    }
    
    func showText() {
        let words = item.text.components(separatedBy: " ")
        let output = NSMutableAttributedString()
        
        let space = NSAttributedString(string: " ", attributes: visibleText)
        
        
        
        for (index, word) in words.enumerated() {
            if index < blankCounter {
                let attributedWord = NSAttributedString(string: word, attributes: visibleText)
                output.append(attributedWord)
            } else {
                let attributedWord = NSAttributedString(string: word, attributes: invisibleText)
                output.append(attributedWord)
                
            }
            output.append(space)
        }
        
        textView.attributedText = output
    }
    
    @objc func wordsTapped() {
        blankCounter += 1
        showText()
    }
}
