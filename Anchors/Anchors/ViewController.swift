

import UIKit

class ViewController: UIViewController {
    
    // кнопка для запуска/перезапуска игры
        lazy var startButtonView = getStartButtonView()
        
        // button for flipping cards
        lazy var flipButtonView = getFlippedCardsButton()
    
    let rootView = UIView()
    
    
    private func getStartButtonView() -> UIButton {
            
            // 1
            // создаем кнопку
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
            
            button.translatesAutoresizingMaskIntoConstraints = false
            // 2
            // изменяем положение кнопки
            button.center.x = view.center.x
            
            // 3
            // получаем доступ к текущему окну
            let window = UIApplication.shared.windows[0]
            
            // определяем отступ сверху от границ окна до Safe Area
            let topPadding = window.safeAreaInsets.top
            
            // устанавливаем координату Y кнопки в соответствии с отступом
            button.frame.origin.y = topPadding
            
            // 3
            // Настраиваем внешний вид кнопки
            
            // 3.1 устанавливаем текст
            button.setTitle("Начать игру", for: .normal)
            
            // 3.2 устанавливаем цвет текста для обычного (не нажатого) состояния
            button.setTitleColor(.black, for: .normal)
            
            // 3.3 устанавливаем цвет текста для нажатого состояния
            button.setTitleColor(.gray, for: .highlighted)
            
            // 3.4 устанавливаем фоновый цвет
            button.backgroundColor = .systemGray4
            
            // 3.5 скругляем углы
            button.layer.cornerRadius = 10
            
            
            // button.addAction(UIAction(title: "", handler: { action in print("Button was pressed") }), for: .touchUpInside)
            
            return button
        }


    private func getFlippedCardsButton() -> UIButton {

            // 1. Creating a button
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            
            // 1.1 Accessing to current window
            let window = UIApplication.shared.windows[0]
        
            

            // 2. Changing position X of the button
            
        button.translatesAutoresizingMaskIntoConstraints = false
        button.rightAnchor.constraint(equalTo: rootView.rightAnchor, constant: 20).isActive = true
            
            // 2.1 Changing position Y of the button
            let topPadding = window.safeAreaInsets.top
            
            // selecting position of our button below the Safe Area of View
            button.frame.origin.y = topPadding

            // 3. Making a custom view of our button
            button.setTitle("Перевернуть", for: .normal)
            
            // set color for text in normal statement of button
            button.setTitleColor(.black, for: .normal)
            
            // set color for text in pressed statement of button
            button.setTitleColor(.gray, for: .highlighted)
            
            // set background color of the button
            button.backgroundColor = .systemGray4
            
            // set corner radius value
            button.layer.cornerRadius = 10
            
            return button
            
            
        }
    
    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let button: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Press me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // добавим кнопку на сцену
                view.addSubview(startButtonView)
                
                // adding our new flip button to scene
                view.addSubview(flipButtonView)
        

        
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(button)
        
        setupView1()
        setupView2()
        setupButton()
        
        
    }

    func setupView1() {
        
        view1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        view1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupView2() {
        
        view2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        view2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupButton() {
        
        button.leftAnchor.constraint(equalTo: view1.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view2.rightAnchor).isActive = true
        button.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

