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

extension Messenger: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщения
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}
/// Теперь при каждом вызове методов send и receive данные о сообщении (значения типа MessageProtocol) будут переданы в менеджер статистики для обработки. Но это произойдет только в том случае, если делегат будет инициализирован свойству statisticDelegate. При этом вызов метода делегата остается незаметным для пользователя класса Messenger. То есть, при использовании Messenger для отправки и получения сообщения вы напрямую не вызываете метод handle

var messenger = Messenger()
messenger.statisticDelegate = messenger.self
messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))

/// # Порядок следования элементов в коде:
/// 1. <#MessageProtocol#>- протокол, описывающий сущность "Сообщение"
/// 2. <#struct Message: MessageProtocol#> - структура, реализующая сущность протокола "Сообщение"
/// 3. <#protocol StatisticDelegate#> - протокол, описывающий сущность "Менеджер статистики"
/// 4. <#protocol MessengerProtocol#> - протокол, описывающий сущность "Мессенджер"
/// 5. <#struct StatisticDelegate#> - структура, реализующая сущность "Менджер статистики"
/// 6. <#struct Messenger#> - структура, реализующая сущность "Мессенджер"
/// 7. <#var messenger#> - создаем экземпляр структуры "Мессенджер"
/// 8.<#extension Messenger: StatisticDelegate#> - расширяем структуру "Месенджер" путем подписи на протокол "Менеджер статистики"
/// 8. <#messenger.statisticDelegate = messenger.self#>- присваиваем свойству экземпляра "Мессенджер" свой же экземпляр, содержащий реализацию протокола StatisticDelegate
/// 9. <#messenger.send#> - отправляем наше сообщение
///

// # - Выделяет текст
// <#> - делает системный шрифт

// В некоторых случаях, а вы будете достаточно часто встречать такие подходы при разработке под iOS, в качестве делегата может назначаться сам тип данных.
// В нашем примере достаточно подписать структуру Messenger на протокол StatisticDelegate (например, с помощью расширения) и в качестве свойства statisticDelegate передать себя

// Примечание. Среди разработчиков довольно популярным является подход, когда обьектный тип подписывают на протокол через создание расширения. Это позволяет сделать код более чистым и структурированным, а так же с легкостью удалить реализацию определенного протокола в случае необходимости.

// Теперь при отправке и приеме сообщения все так же будет вызываться метод handle, только теперь он объявлен непосредственно в структуре Messenger



/// # Работа с памятью
// Если тип сам является делегатом (как было показано выше) и при этом реализован как структура, то при передаче значения свойству statisticDelegate создается копия структуры!
// То есть, значение, хранящееся в параметре messenger и значение, хранящееся в свойстве statisticDelegate - это две копии, два различных значения.

messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))
messenger.messages.count
(messenger.statisticDelegate as! Messenger).messages.count

// В первом случае передано 2 сообщения, а во втором ни одного.
// Этот момент очень важен, так как может возникнуть желание получить доступ к значению свойства messages внутри делегата, а это приведет к ошибочным результатам.

// Решим проблему в следующей версии приложения Contacts v1.2 с помощью классов
