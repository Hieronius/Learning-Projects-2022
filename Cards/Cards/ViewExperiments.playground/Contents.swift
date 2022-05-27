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
        
        // инициализируем красный квадрат, как полноценное view
        let redView = getRedView()
        
        // инициализируем зеленый квадрат, как полноценное view
        let greenView = getGreenView()
        
        // инициализируем белый квадрат, как полноценное view
        let whiteView = getWhiteView()
        
        // установим требование к расположению зеленого квадрата относительно красного
        set(view: greenView, toCenterOfView: redView)
        
        // установим требование к расположению белого квадрата относительно красного
        set(view: whiteView, toCenterOfView: redView)
        
        
        self.view.addSubview( redView )
        redView.addSubview( greenView )
        redView.addSubview( whiteView )
        
    }
    
    
    // Создание красного квадрата
    private func getRedView() -> UIView {
        
        let viewFrame = CGRect(x: 50, y: 50, width: 200, height: 200)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .red
        
        // обрезаем дочернее view по границам родительского
        view.clipsToBounds = true
        
        return view
    }
    
    // Создание зеленого квадрата
    private func getGreenView() -> UIView {
        
        let viewFrame = CGRect(x: 10, y: 10, width: 180, height: 180)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .green
        return view
    }
    
    private func getWhiteView() -> UIView {
        
        let viewFrame = CGRect(x:0, y:0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    
    private func set(view moveView: UIView, toCenterOfView baseView: UIView) {
        
        // размеры дочернего представления
        let moveViewWidth = moveView.frame.width
        let moveViewHeight = moveView.frame.height
        
        // размеры родительского представления
        let baseViewWidth = baseView.frame.width
        let baseViewHeight = baseView.frame.height
        
        // вычисление и изменение координат
        let newXCoordinate = (baseViewWidth - moveViewWidth) / 2
        let newYCoordinate = (baseViewHeight - moveViewHeight) / 2
        moveView.frame.origin = CGPoint(x: newXCoordinate, y: newXCoordinate)
        
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
