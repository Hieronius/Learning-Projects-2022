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
        creatBezier2(on: view)
        creatBezier3(on: view)
        
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
        
        
        // 5. Используем метод close()
        path.close()
        
        
        // 6. Создание второго треугольника
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 170))
        path.addLine(to: CGPoint(x: 50, y: 170))
        path.close()
        
        
        
        return path
    }
    
    private func creatBezier2(on view: UIView) {
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
        shapeLayer.path = getRect().cgPath
        

        
    }
    
    private func getRect() -> UIBezierPath {
        
        // 7. Создание прямоугольника
        let rect = CGRect(x: 150, y: 200, width: 200, height: 100)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 30)
        return path
    }
    
    
    private func creatBezier3(on view: UIView) {
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
        shapeLayer.path = getArc().cgPath
        
    }
    private func getArc() -> UIBezierPath {
        
        let centerPoint = CGPoint(x: 200, y: 400)
        let path = UIBezierPath(arcCenter: centerPoint,
                                radius: 150,
                                startAngle: 0,
                                endAngle: .pi*2,
                                clockwise: true)
        return path
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
