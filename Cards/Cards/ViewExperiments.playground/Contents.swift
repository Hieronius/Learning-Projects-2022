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
        
        // инициализируем розовое представление, как полноценное view
        let pinkView = getPinkView()
        
        // установим требование к расположению зеленого квадрата относительно красного
        set(view: greenView, toCenterOfView: redView)
        
        // позиционируем белое представление с помощью center
        whiteView.center = greenView.center
        
        
        self.view.addSubview( redView )
        self.view.addSubview( pinkView )
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
    
    // Создание белого представления
    private func getWhiteView() -> UIView {
        
        let viewFrame = CGRect(x:0, y:0, width: 50, height: 50)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        return view
    }
    
    // Создание розового представления
    private func getPinkView() -> UIView {
        let viewFrame = CGRect(x: 50, y: 300, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .systemPink
        
        // толщина границ
        view.layer.borderWidth = 5
        
        // цвет границ
        view.layer.borderColor = UIColor.yellow.cgColor
        
        // скругление углов
        view.layer.cornerRadius = 10
        
        // видимость тени
        view.layer.shadowOpacity = 0.95
        
        // размытие тени
        view.layer.shadowRadius = 20
        
        // смещение тени
        view.layer.shadowOffset = CGSize(width: 10, height: 20)
        
        // цвет тени
        view.layer.shadowColor = UIColor.white.cgColor
        
        // прозрачность слоя
        view.layer.opacity = 0.7
        
        // цвет фона
        view.layer.backgroundColor = UIColor.systemPink.cgColor
        
        
        // создание дочернего слоя
        let layer = CALayer()
        
        // изменение фонового цвета
        layer.backgroundColor = UIColor.black.cgColor
        
        // изменение размеров и положения
        layer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        
        // изменение радиуса скругленных углов
        layer.cornerRadius = 10
        
        // добавление в иерархию слоев
        view.layer.addSublayer(layer)
        
        
        // вывод на консоль размеров представления
        print(view.frame)
        
        // поворот представления
        //view.transform = CGAffineTransform(rotationAngle: .pi/4)
        
        // растяжение представления
        view.transform = CGAffineTransform(scaleX: 1.5, y: 0.7)
        
        // вывод на консоль размеров представления
        print(view.frame)
        
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
