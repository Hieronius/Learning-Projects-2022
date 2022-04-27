/// # Поработаем теперь с шаблоном "Источник данных"
/// # "Источник данных" (Data source) - это частный случай шаблона "Делегирование". Если в случае классического делегирования вы передаете делегату данные для обработки, то в "Источнике данных" базовый элемент наоборот запрашивает данные для самостоятельного решения задачи

// Рассмотрим возможность применения "Источника" на примере нашего мессенджера
// Мы можем использовать его для получения списка сообщений, их загрузки из базы данных


import Foundation

// 1. Протокол, описывающий требования к сущности "сообщение"
protocol MessageProtocol {
    // текст сообщения
    var text: String? { get set }
    // прикрепленное изображение
    var image: Data? { get set }
    // прикрепленный аудиофайл
    var audio: Data? { get set }
    // прикрепленный видеофайл
    var video: Data? { get set }
    // дата отправки
    var sendDate: Date { get set }
    // отправитель
    var senderID: UInt { get set }
}

// 2. Структура, реализующая протокол сущности "сообщение"
struct Message: MessageProtocol {
    var text: String?
    var image: Data?
    var audio: Data?
    var video: Data?
    var sendDate: Date
    var senderID: UInt
}

// Свойства text, image, audio and video представлены в виде опционала, так как данные могут отсутствовать. Например, вы можете отправить картинку с текстом, в этом случае в audio and video не будет значений.

// Для параметров image, audio and video используется тип Data, который позволяет представить некоторые данные в виде простой байтовой последовательности.

// Тип Data по сути может описать, что угодно.

// Для работы с датой и временем в Swift используется тип данных Date (не путать с Data)

// Для работы Data and Date необходим фреймворк Foundation

// 3. Протокол, описывающий сущность "Менеджер статистики"
protocol StatisticDelegate: AnyObject {
    func handle(message: MessageProtocol)
}

// 4. Реазилуем новый протокол, описывающий источник данных
protocol MessengerDataSourceProtocol: class {
    func getMessages() -> [MessageProtocol]
}

// Добавляем свойство dataSource в протокол "Менеджер сообщений"

// 5. Протокол, описывающий сущность "Мессенджер"
protocol MessengerProtocol {
    // массив всех сообщений
    var messages: [MessageProtocol] { get set }
    // делегат ведения статистики
    var statisticDelegate: StatisticDelegate? { get set }
    
    // 5.1 Добавляем свойства dataSource в протокол "Менеджер сообщений"
    var dataSource: MessengerDataSourceProtocol? { get set }
    
    // инициализатор
    init()
    // принять сообщение
    mutating func receive(message: MessageProtocol)
    // отправить сообщение
    mutating func send(message: MessageProtocol)
    
    // mutating ставим потому что эта функция будет меняться в зависимости от реализации протокола. Если это структура и Enum то без mutating не дадут "мутировать". Надо разобраться с классами.
}


// 6. Класс, реализующая сущность "Мессенджер"
class Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    weak var statisticDelegate: StatisticDelegate?
    
    // 6.1 Реализуем свойство dataSource в классе Messenger
    // Свойство DataSource включает в себя наблюдатель. Если потребуется изменить значение данного свойства, то незамедлительно будет произведена загрузка всех сообщений.
    weak var dataSource: MessengerDataSourceProtocol? {
        didSet {
            if let source = dataSource {
                messages = source.getMessages()
            }
        }
    }
    
    required init() {
        messages = []
    }
    
    func receive(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // прием сообщения
        // ...
    }
    
    func send(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // отправка сообщения
        // ...
    }
}

// 7. Подписываем сущность "Мессенджер" на протокол "Менеджер статистики"
extension Messenger: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщения
        // ...
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}

// 8. Теперь создаем реализацию непосредственно самого "источника данных" с помощью расширения класса "Мессенджер"
extension Messenger: MessengerDataSourceProtocol {
    
    // Метод getMessages возвращает массив, состоящий из одного сообщения. В реальном проекте можно было бы реализовать, например, загрузку сообщений с сервера или из базы данных.
    func getMessages() -> [MessageProtocol] {
        return [Message(text: "Как дела?", sendDate: Date(), senderID: 2)]
    }
}

// 9. Создаем экземпляр класса "Мессенджер"
var messenger = Messenger()

// 10. Присваиваем свойству экземпляра "Мессенджер" свой же экземпляр, содержащий реализацию "Источника данных"
messenger.dataSource = messenger.self

// 11. Проверяем число сообщений
messenger.messages.count // 1



// MARK: Порядок следования элементов в коде
/// # Порядок следования элементов в коде:
/// 1. <#MessageProtocol#>- протокол, описывающий сущность "Сообщение"
/// 2. <#struct Message: MessageProtocol#> - структура, реализующая сущность протокола "Сообщение"
/// 3. <#protocol StatisticDelegate: AnyObject#> - протокол, описывающий сущность "Менеджер статистики"
/// 4. <#protocol MessengerDataSourceProtocol: class#> - реализуем новый протокол, описывающий "Источник данных"
/// 5. <#protocol MessengerProtocol#> - протокол, описывающий сущность "Мессенджер"
/// 5.1 <#var dataSource: MessengerDataSourceProtocol? { get set }#> - реализуем свойство "Источника" в протоколе "Мессенджер"
/// 6. <#class Messenger: MessengerProtocol#> - класс, реализующая сущность "Мессенджер"
/// 6.1 <#weak var dataSource: MessengerDataSourceProtocol?#> - реализуем свойство dataSource в классе "Мессенджер"
/// 7. <#extension Messenger: StatisticDelegate#> - расширяем сущность "Мессенджер" с помощью подписи на протокол "Менеджер статистики"
/// 8.<#extension Messenger: MessengerDataSourceProtocol#> - создаем реализацию "источника данных" с помощью расширения класса "Мессенджер"
/// 9. <#var messenger#> - создаем экземпляр структуры "Мессенджер"
/// 10. <#messenger.dataSource = messenger.self#> - присваиваем свойству экземпляра "Мессенджер" свой же экземпляр, содержащий реализацию "Источника данных"
/// 11. <#messenger.messages.count#> - Проверяем текущее число сообщений. Оно равно одному.

// # - Выделяет текст
// <#> - делает системный шрифт
