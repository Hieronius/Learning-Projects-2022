

import Foundation

protocol GameRoundProtocol {
    // Количество заработанных за раунд очков
    var score: Int { get }
    // Загаданное значение
    var currentSecretValue: Int { get }
    // Подсчет заработанных за раунд очков
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    // Подсчитывает количество очков
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score = 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score = 50 - currentSecretValue + value
        } else {
            score = 50
        }
    }
}
