

import UIKit

class BoardGameController: UIViewController {
    
    // кнопка для запуска/перезапуска игры
    lazy var startButtonView = getStartButtonView()
    
    private func getStartButtonView
    
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
