

import UIKit

class BoardGameController: UIViewController {
    
    override func loadView() {
        super.loadView()
        
        // добавим кнопку на сцену
        view.addSubview(startButtonView)
    }
    
    
    // игровое поле
    lazy var boardGameView = getBoardGameView()
    
    private func getBoardGameView() -> UIView {
        
        // отступ игрового поля от ближайших элементов
        let margin: CGFloat = 10
        
        let boardView = UIView()
        
        // указываем координаты
        // x
        boardView.frame.origin.x = margin
        
        // y
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        boardView.frame.origin.y = topPadding + startButtonView.frame.height + margin
        
        // рассчитываем ширину
        boardView.frame.size.width = UIScreen.main.bounds.width - margin*2
        
        // рассчитыаем высоту с учетом нижнего отступа
        let bottomPadding = window.safeAreaInsets.bottom
        boardView.frame.size.height = UIScreen.main.bounds.height - boardView.frame.origin.y - margin - bottomPadding
        
        // изменяем стиль игрового поля
        boardView.layer.cornerRadius = 5
        boardView.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1, alpha: 0.3)
        
        return boardView
    }
    
    @objc func startGame(_ sender: UIButton) {
        print("button was pressed")
    }
    
    
    // кнопка для запуска/перезапуска игры
    lazy var startButtonView = getStartButtonView()
    
    private func getStartButtonView() -> UIButton {
        
        // 1
        // создаем кнопку
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        // 2
        // изменяем положение кнопки
        button.center.x = view.center.x
        
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
        
        // подключаем обработчик нажатия на кнопку
        button.addTarget(nil, action: #selector(startGame(_:)), for: .touchUpInside)
        
        // button.addAction(UIAction(title: "", handler: { action in print("Button was pressed") }), for: .touchUpInside)
        
        return button
    }
    
   
    
    // количество пар уникальных карточек
    var cardsPairCounts = 8
    
    // сущность "Игра"
    lazy var game: Game = getNewGame()
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairCounts
        game.generateCards()
        return game
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}
