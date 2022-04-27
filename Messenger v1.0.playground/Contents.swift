import Foundation

// Протокол, описывающий требования к сущности "сообщение"
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

// Структура, реализующая протокол сущности "сообщение"
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

// Теперь перейдем к реализации сущностей "Мессенджер" и "Менеджер статистики"

// 1. Реализуем протоколы MessangerProtocol и StatisticDelegate, которые определяют требования к набору свойств и методов "Мессенджера" и "Менеджера статистики"


// Протокол, описывающий сущность "Менеджер статистики"
protocol StatisticDelegate {
    func handle(message: MessageProtocol)
}

// Протокол, описывающий сущность "Мессенджер"
protocol MessengerProtocol {
    // массив всех сообщений
    var messages: [MessageProtocol] { get set }
    // делегат ведения статистики
    var statisticDelegate: StatisticDelegate? { get set }
    // инициализатор
    init()
    // принять сообщение
    mutating func receive(message: MessageProtocol)
    // отправить сообщение
    mutating func send(message: MessageProtocol)
    
    // mutating ставим потому что эта функция будет меняться в зависимости от реализации протокола. Если это структура и Enum то без mutating не дадут "мутировать". Надо разобраться с классами.
}

// Важно обратить внимание на то, что все зависимости между сущностями основаны на использовании протоколов, т.е. в MessengerProtocol и statisticDelegate нигде не используется прямая ссылка на тип Message. Вместо этого используется протокол MessageProtocol

// Протоколы должны ссылаться на протоколы, а не на конкретные типы данных.

// Структура, реализующая сущность "менеджер статистики"
struct StatisticManager: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщений
        // ...
        print("обработка сообщений от User # \(message.senderID) завершена")
    }
}

// Структура, реализующая сущность "менеджер сообщений"
struct Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    var statisticDelegate: StatisticDelegate?
    
    init() {
        messages = []
    }
    
    mutating func receive(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // прием сообщения
        // ...
    }
    
    mutating func send(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // отправка сообщения
        // ...
    }
}

/// Теперь при каждом вызове методов send и receive данные о сообщении (значения типа MessageProtocol) будут переданы в менеджер статистики для обработки. Но это произойдет только в том случае, если делегат будет инициализирован свойству statisticDelegate. При этом вызов метода делегата остается незаметным для пользователя класса Messenger. То есть, при использовании Messenger для отправки и получения сообщения вы напрямую не вызываете метод handle

var messenger = Messenger()
messenger.statisticDelegate = StatisticManager()
messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))

/// # Порядок следования элементов в коде:
/// 1. <#MessageProtocol#>- протокол, описывающий сущность "Сообщение"
/// 2. <#struct Message: MessageProtocol#> - структура, реализующая сущность протокола "Сообщение"
/// 3. <#protocol StatisticDelegate#> - протокол, описывающий сущность "Менеджер статистики"
/// 4. <#protocol MessengerProtocol#> - протокол, описывающий сущность "Мессенджер"
/// 5. <#struct StatisticDelegate#> - структура, реализующая сущность "Менджер статистики"
/// 6. <#struct Messenger#> - структура, реализующая сущность "Мессенджер"
/// 7. <#var messenger#> - создаем экземпляр структуры "Мессенджер"
/// 8. <#messenger.statisticDelegate#> - присваиваем свойству экземпляра "Мессенджер" экземпляр структуры "Менеджер статистики"
/// 9. <#messenger.send#> - отправляем наше сообщение
///

// # - Выделяет текст
// <#> - делает системный шрифт

