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
        self.view.addSubview( getRedView() )
        
    }
    
    // Создание красного квадрата
    private func getRedView() -> UIView {
        
        let viewFrame = CGRect(x: 50, y: 50, width: 200, height: 200)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        return view
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
