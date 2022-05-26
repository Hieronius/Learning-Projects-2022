//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        setupViews()
    }
    
    // настройка представлений сцены:
    private func setupViews() {
        
        self.view = getRootView()
        
    }
    
    // создание корневого view
    private func getRootView() -> UIView {
    let view = UIView()
    view.backgroundColor = .gray
    return view

}
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
