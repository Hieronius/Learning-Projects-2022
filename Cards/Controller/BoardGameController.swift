

import UIKit

class BoardGameController: UIViewController {
    
    // кнопка для запуска/перезапуска игры
    lazy var startButtonView = getStartButtonView()
    
    private func getStartButtonView() -> UIButton {
        
        // 1
        // создаем кнопку
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        // 2
        // изменяем положение кнопки
        button.center.x = view.center.x
        
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
