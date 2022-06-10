import UIKit

class Game {
    
    // Количество пар уникальных карточек
    var cardsCount = 0
    
    // Массив сгенерированных карточек
    var cards = [Card]()
    
    // Генерация массива случайных карточек
    func generateCards() {
        
        // генерируем новый массив карточек
        var cards = [Card]()
        for _ in 0...cardsCount {
            let randomElement = (type: CardType.allCases.randomElement()!, color: CardColor.allCases.randomElement()!)
            cards.append(randomElement)
        }
        self.cards = cards
    }
    
    // Проверка эквивалетности карточек
    func checkCards(_ firstCard: Card, _ secondCard: Card) -> Bool {
        if firstCard == secondCard {
            return true
        }
        return false
    }
    
    
}
