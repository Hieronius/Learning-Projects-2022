//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() не может быть использован для создания экземпляра")
    }
}


class CircleShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        // рассчитываем данные круга
        // радиус равен половине меньшей из сторон
        let radius = ([size.width, size.height].min() ?? 0) / 2
        
        // центр круга равен центрам каждый из сторон
        let centerX = size.width / 2
        let centerY = size.height / 2
        
        // рисуем круг
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: 0, endAngle: .pi*2, clockwise: true)
        path.close()
        
        // инициализируем созданный путь
        self.path = path.cgPath
        
        // изменяем цвет
        self.fillColor = fillColor
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class SquareShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
    
    
    // Сторона равна меньшей из сторон
    let edgeSize = ([size.width, size.height].min() ?? 0)
    
    // Рисуем квадрат
    let rect = CGRect(x: 150, y: 150, width: edgeSize, height: edgeSize)
    let path = UIBezierPath(rect: rect)
    path.close()
    
    // Инициализируем созданный путь
    self.path = path.cgPath
    
    // Изменяем цвет
    self.fillColor = fillColor
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        // круг
        view.layer.addSublayer(CircleShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
        
        // квадрат
        view.layer.addSublayer(SquareShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
    }
}


// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
