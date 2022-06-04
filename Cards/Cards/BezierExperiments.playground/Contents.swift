//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        // создаем кривые на сцене
        creatBezier(on: view)
        
    }
    
    private func creatBezier(on view: UIView) {
        // 1
        // Создаем графический контекст (слой)
        // на нем в дальнейшем будем рисовать кривые
        let shapeLayer = CAShapeLayer()
        // 2
        // добавляем слой в качестве дочернего к корневому слою корневого представления
        view.layer.addSublayer(shapeLayer)
        
    
        // 3
        // изменение цвета линий
        shapeLayer.strokeColor = UIColor.gray.cgColor
        
        // изменение толщины линий
        shapeLayer.lineWidth = 5
        
        // 5. Задаем цвет фона
        shapeLayer.fillColor = UIColor.green.cgColor
        
        
        // 4
        // Создание фигуры
        shapeLayer.path = getPath().cgPath
    }
    
    private func getPath() -> UIBezierPath {
        // 1
        let path = UIBezierPath()
        // 2
        path.move(to: CGPoint(x: 50, y: 50))
        // 3
        path.addLine(to: CGPoint(x: 150, y: 50))
        
        
        // 4. Создание второй линии
        path.addLine(to: CGPoint(x: 150, y: 150))
        return path
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
