//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreText


protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() не может быть использован для создания экземпляра")
    }
}

protocol FlippableVIew: UIView {
    var isFlipped: Bool { get set }
    var flipCompetionHandler: ((FlippableVIew) -> Void)? { get set }
    func flip()
}

class CardView<ShapeType: ShapeLayerProtocol>: UIView, FlippableVIew {
    
    var isFlipped: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var flipCompetionHandler: ((FlippableVIew) -> Void)?
    
    
    func flip() {
        
        // определяем, между какими представлениями осуществить переход
        let fromView = isFlipped ? frontSideView : backSideView
        let toView = isFlipped ? backSideView : frontSideView
        
        // запускаем анимированный переход
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionFlipFromTop], completion: { _ in
            // обработчик переворота
            self.flipCompetionHandler?(self)
        })
        isFlipped.toggle()
    }
    
    // радиус закругления
    var cornersRadius = 20
    
    // цвет фигуры
    var color: UIColor!
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
        
        
        setupBorders()
    }
    
    // настройка границ
    private func setupBorders() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornersRadius)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        
        // удаляем добавленные ранее представления
        backSideView.removeFromSuperview()
        frontSideView.removeFromSuperview()
        
        // добавляем новые представления
        if isFlipped {
            self.addSubview(backSideView)
            self.addSubview(frontSideView)
        } else {
            self.addSubview(frontSideView)
            self.addSubview(backSideView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // внутренний отступ представления
    private let margin: Int = 10
    
    // представление с лицевой стороны карты
    lazy var frontSideView: UIView = self.getFrontSideView()
    
    // представление с обратной стороны карты
    lazy var backSideView: UIView = self.getBackSideView()
    
    // возвращает представление с лицевой стороны
    private func getFrontSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = .white
    
    
    let shapeView = UIView(frame: CGRect(x: margin, y: margin, width: Int(self.bounds.width)-margin*2, height: Int(self.bounds.height)-margin*2))
    view.addSubview(shapeView)
        
        // создание слоя с фигурой
        let shapeLayer = ShapeType(size: shapeView.frame.size, fillColor: color.cgColor)
        shapeView.layer.addSublayer(shapeLayer)
        
        // скругляем углы корневого слоя
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(cornersRadius)
        
        return view
    }
    
    // возвращает представление с обратной стороны
    private func getBackSideView() -> UIView {
        let view = UIView(frame: self.bounds)
        
        view.backgroundColor = .white
        
        // выбор случайного узора для рубашки
        switch ["circle", "line"].randomElement()! {
        case "circle":
            let layer = BackSideCircle(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        case "line":
            let layer = BackSideLine(size: self.bounds.size, fillColor: UIColor.black.cgColor)
            view.layer.addSublayer(layer)
        default:
            break
        }
        
        // скругляем углы корневого слоя
        view.layer.masksToBounds = true
        view.layer.cornerRadius = CGFloat(cornersRadius)
        
        return view
    }
    
    
    
    // точка привязки
    private var anchorPoint: CGPoint = CGPoint(x:0, y:0)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // изменяем координаты точки привязки
        anchorPoint.x = touches.first!.location(in: window).x - frame.minX
        anchorPoint.y = touches.first!.location(in: window).y - frame.minY
        
        // сохраняем исходные координаты
        startTouchPoint = frame.origin
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.frame.origin.x = touches.first!.location(in: window).x - anchorPoint.x
        self.frame.origin.y = touches.first!.location(in: window).y - anchorPoint.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        flip()
    }
    
    // исходные координаты игральной карточки
    private var startTouchPoint: CGPoint!
    
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


class CrossShape: CAShapeLayer, ShapeLayerProtocol {
    
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        
        // Рисуем крест
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.move(to: CGPoint(x: size.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        
        // Инициализуем созданный путь
        self.path = path.cgPath
        
        // Изменяем цвет
        self.strokeColor = fillColor
        self.lineWidth = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class FillShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        self.path = path.cgPath
        
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BackSideCircle: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        
        // Рисуем 15 кругов
        for _ in 1...15 {
            
            // координаты центра очередного круга
            let randomX = Int.random(in: 0...Int(size.width))
            let randomY = Int.random(in: 0...Int(size.height))
            let center = CGPoint(x: randomX, y: randomY)
            
            // смещаем указатель к центру круга
            path.move(to: center)
            
            // определяем случайный радиус
            let radius = Int.random(in: 5...15)
            
            // рисуем круг
            path.addArc(withCenter: center, radius: CGFloat(radius), startAngle: 0, endAngle: .pi*2, clockwise: true)
        }
        
        // инициализируем созданный путь
        self.path = path.cgPath
        
        // изменяем цвет
        self.strokeColor = fillColor
        self.fillColor = fillColor
        self.lineWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



class BackSideLine: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
    
    
        let path = UIBezierPath()
        
        // рисуем 15 линий
        for _ in 1...15 {
            
            // координаты начала очередной линии
            let randomXStart = Int.random(in: 0...Int(size.width))
            let randomYStart = Int.random(in: 0...Int(size.height))
            
            // координаты конца очередной линии
            let randomXEnd = Int.random(in: 0...Int(size.width))
            let randomYEnd = Int.random(in: 0...Int(size.height))
        
        
        // смещаем указатель к началу линии
        path.move(to: CGPoint(x: randomXStart, y: randomYStart))
        
        // рисуем линию
        path.addLine(to: CGPoint(x: randomXEnd, y: randomYEnd))
            
        }
        
        // инициализируем созданный путь
        self.path = path.cgPath
        
        // изменяем стиль линий
        self.strokeColor = fillColor
        self.lineWidth = 3
        self.lineCap = .round
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
        
        
        // игральная карточка рубашкой вверх
        let firstCardView = CardView<CircleShape>(frame: CGRect(x: 0, y: 0, width: 120, height: 150), color: .red)
        firstCardView.flipCompetionHandler = { card in
            card.superview?.bringSubviewToFront(card)
        }
        self.view.addSubview(firstCardView)
       
        
        // игральная карточка лицевой стороной вверх
        let secondCardView = CardView<CircleShape>(frame: CGRect(x: 200, y: 0, width: 120, height: 150), color: .red)
        secondCardView.flipCompetionHandler = { card in
            card.superview?.bringSubviewToFront(card)
        }
        self.view.addSubview(secondCardView)
        secondCardView.isFlipped = true
        // круг
        // view.layer.addSublayer(CircleShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
        
        // квадрат
        // view.layer.addSublayer(SquareShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
        
        // крест
        //view.layer.addSublayer(CrossShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
        
        // прямоугольник
        //view.layer.addSublayer(FillShape(size: CGSize(width: 200, height: 150), fillColor: UIColor.gray.cgColor))
    }
    
    
}

extension UIResponder {
    func responderChain() -> String {
        guard let next = next else {
            return String(describing: Self.self)
        }
        return String(describing: Self.self) + " -> " + next.responderChain()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
