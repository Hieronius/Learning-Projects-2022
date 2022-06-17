import UIKit


// протокол отвечающий за переворот карты
protocol FlippableVIew: UIView {
    var isFlipped: Bool { get set }
    var flipCompletionHandler: ((FlippableVIew) -> Void)? { get set }
    func flip()
}


class CardView<ShapeType: ShapeLayerProtocol>: UIView, FlippableVIew {
    
    // перевернута ли карта
    // false - если обратной стороной
    // если перевернуть попросить систему заново отрисовать представления
    var isFlipped: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    // обработчик завершения
    var flipCompletionHandler: ((FlippableVIew) -> Void)?
    
    // радиус закругления
    var cornersRadius = 20
    
    // цвет фигуры
    var color: UIColor!
    
    // отступ от краев корневого представления до фигуры
    private let margin: Int = 10
    
    // представление с лицевой стороны карты
    lazy var frontSideView: UIView = self.getFrontSideView()
    
    // представление с обратной стороны карты
    lazy var backSideView: UIView = self.getBackSideView()
    
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.color = color
        
        
        setupBorders()
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
    
    
    // настройка границ
    private func setupBorders() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornersRadius)
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
        // Сюда добавим новый узор
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
    
    // исходные координаты игральной карточки
    private var startTouchPoint: CGPoint!
    
    
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
    
    // I think exectly here i should implement code to prevent cards from moving out from game board
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.frame.origin == startTouchPoint {
            flip()
        }
        if touches.first!.location(in: ).x > (self.superview?.frame.maxX)! || touches.first!.location(in: window).y > (self.superview?.frame.maxY)! {
            self.frame.origin = self.startTouchPoint
        }
        
//        let superViewMaxX = self.superview?.bounds.maxX
//        let superViewMaxY = self.superview?.bounds.maxY
        
        
        
//        if self.frame.origin.x > ((self.superview?.bounds.maxX)!) && self.frame.origin.y > ((self.superview?.bounds.maxY)!) { // ||
//            // self.frame.origin.x < (self.superview?.bounds.height)! || self.frame.origin.y < (self.superview?.frame.width)! {
//            self.frame.origin = self.startTouchPoint
//        }
        
    }
    
    
    func flip() {
        
        // определяем, между какими представлениями осуществить переход
        let fromView = isFlipped ? frontSideView : backSideView
        let toView = isFlipped ? backSideView : frontSideView
        
        // запускаем анимированный переход
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.transitionFlipFromTop], completion: { _ in
            // обработчик переворота
            self.flipCompletionHandler?(self)
        })
        isFlipped.toggle()
    }
    
}
