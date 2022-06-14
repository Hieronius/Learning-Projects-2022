

import UIKit

class BoardGameController: UIViewController {
    
    // количество пар уникальных карточек
    var cardsPairCounts = 8
    
    // сущность "Игра"
    lazy var game: Game = getNewGame()
    
    // кнопка для запуска/перезапуска игры
    lazy var startButtonView = getStartButtonView()
    
    // игровое поле
    lazy var boardGameView = getBoardGameView()
    
    // игральные карточки
    var cardViews = [UIView]()
    
    // размеры карточек
    private var cardSize: CGSize {
        CGSize(width: 80, height: 120)
    }
    
    // предположительно перевернутые карточки
    private var flippedCards = [UIView]()
    
    // предельные координаты размещения карточки
    // по ширине
    private var cardMaxXCoordinate: Int {
        Int(boardGameView.frame.width - cardSize.width)
    }
    
    // по высоте
    private var cardMaxYCoordinate: Int {
        Int(boardGameView.frame.height - cardSize.height)
    }
    
    
    // Загрузка наших представлений и обьектов
    override func loadView() {
        super.loadView()
        
        // добавим кнопку на сцену
        view.addSubview(startButtonView)
        
        // добавляем игровое поле на сцену
        view.addSubview(boardGameView)
        
    }
    
    
    // генерация массива карточек на основе данных Модели
    private func getCardsBy(modelData: [Card]) -> [UIView] {
        
        // хранилище для представлений карточек
        var cardViews = [UIView]()
        
        // фабрика карточек
        let cardViewFactory = CardViewFactory()
        
        // перебираем массив карточек в Модели
        for (index, modelCard) in modelData.enumerated() {
            
            // добавляем первый экземпляр карты
            let cardOne = cardViewFactory.get(modelCard.type, withSize: cardSize, andColor: modelCard.color)
            cardOne.tag = index
            cardViews.append(cardOne)
            
            // добавляем второй экземпляр карты
            let cardTwo = cardViewFactory.get(modelCard.type, withSize: cardSize, andColor: modelCard.color)
            cardTwo.tag = index
            cardViews.append(cardTwo)
        }
        
        // добавляем всем картам обработчик поворота
        for card in cardViews {
            
            (card as! FlippableVIew).flipCompletionHandler = { [self] flippedCard in
                
                // переносим карточку вверх иерархии
                flippedCard.superview?.bringSubviewToFront(flippedCard)
                
                // добавляем или удаляем карточку
                if flippedCard.isFlipped {
                    self.flippedCards.append(flippedCard)
                } else {
                    if let cardIndex = self.flippedCards.firstIndex(of: flippedCard) {
                        self.flippedCards.remove(at: cardIndex)
                    }
                }
                
                // если перевернуто две карточки
                if self.flippedCards.count == 2 {
                    
                    // получаем карточки из данных модели
                    let firstCard = game.cards[self.flippedCards.first!.tag]
                    let secondCard = game.cards[self.flippedCards.last!.tag]
                    
                    // если карточки одинаковые
                    if game.checkCards(firstCard, secondCard) {
                        
                        // сперва анимированно скрываем их
                        UIView.animate(withDuration: 0.3, animations: {
                            self.flippedCards.first!.layer.opacity = 0
                            self.flippedCards.last!.layer.opacity = 0
                            
                            // после чего удаляем из иерархии
                        }, completion: {_ in
                            self.flippedCards.first!.removeFromSuperview()
                            self.flippedCards.last!.removeFromSuperview()
                            self.flippedCards = []
                        })
                        
                        // в ином случае
                        
                    } else {
                        
                        // переворачиваем карточки рубашкой вверх
                        for card in self.flippedCards {
                            (card as! FlippableVIew).flip()
                        }
                    }
                }
            }
        }
        
        return cardViews
    }
    
    
    private func placeCardsOnBoard(_ cards: [UIView]) {
        
        // удаляем все имеющиеся на игровом поле карточки
        for card in cardViews {
            card.removeFromSuperview()
        }
        
        cardViews = cards
        
        // перебираем карточки
        for card in cardViews {
            
            // для каждой карточки генерируем случайные координаты
            let randomXCoordinate = Int.random(in: 0...cardMaxXCoordinate)
            let randomYCoordinate = Int.random(in: 0...cardMaxYCoordinate)
            card.frame.origin = CGPoint(x: randomXCoordinate, y: randomYCoordinate)
            
            // размещаем карточку на игровом поле
            boardGameView.addSubview(card)
        }
    }
    
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairCounts
        game.generateCards()
        return game
    }
    
    
    @objc func startGame(_ sender: UIButton) {
        game = getNewGame()
        let cards = getCardsBy(modelData: game.cards)
        placeCardsOnBoard(cards)
    }
    
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
