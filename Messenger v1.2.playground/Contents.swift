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

// Теперь перейдем к реализации сущностей "Мессенджер" и "Менеджер статистики"

// 1. Реализуем протоколы MessangerProtocol и StatisticDelegate, которые определяют требования к набору свойств и методов "Мессенджера" и "Менеджера статистики"


// 3. Протокол, описывающий сущность "Менеджер статистики"
protocol StatisticDelegate: AnyObject {
    func handle(message: MessageProtocol)
}

// 4. Протокол, описывающий сущность "Мессенджер"
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


// 5. Класс, реализующая сущность "Мессенджер"
class Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    weak var statisticDelegate: StatisticDelegate?
    
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

// 6. Подписываем сущность "Мессенджер" на протокол "Менеджер статистики"
extension Messenger: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщения
        // ...
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}
/// Теперь при каждом вызове методов send и receive данные о сообщении (значения типа MessageProtocol) будут переданы в менеджер статистики для обработки. Но это произойдет только в том случае, если делегат будет инициализирован свойству statisticDelegate. При этом вызов метода делегата остается незаметным для пользователя класса Messenger. То есть, при использовании Messenger для отправки и получения сообщения вы напрямую не вызываете метод handle

// 7. Создаем экземпляр класса "Мессенджер"
var messenger = Messenger()

// 8. Присваиваем свойству экземпляра "Мессенджер" свой же экземпляр, содержащий реализацию протокола "Менеджер статистики"
messenger.statisticDelegate = messenger.self

// 9. Отправляем наше сообщение
messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))

// 9.1 Сверяем число сообщений
(messenger.statisticDelegate as! Messenger).messages.count


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

// Решим проблему c помощью реализации сущности "Мессенджер" с помощью класса.
// В этом случае в свойстве statisticDelegate будет храниться ссылка на текущий экземпляр, а не его копия (класс - reference type)

/// # Внесем несколько правок в наш код:
/// 1. Для того, чтобы избежать утечек памяти, ссылка в свойстве statistic Delegate должна быть слабой, т.е. необходимо ее пометить с помощью ключевого слова weak
/// 2. Протокол StatisticDelegate необходимо пометить с помощью ключевого слова class (или AnyObject). В ином случае предыдущий пункт не сможет быть выполнен (слабой ссылка может быть только на reference type - класс)
/// 3. В реализации класса Messenger не должны использоваться ключевые слова mutating. Они предназначены только для структур.

/// Примерами использования делегатов могут уже упомянутые выше табличные представления, так и другие элементы, доступные при разработке приложения.
/// Так, текстовые поля используют делегаты в том числе для того, чтобы обработать вводимый пользователем текст (например, разрешить ввод числа) или определить порядок действий после нажатия кнопки "Готово".



// MARK: Порядок следования элементов в коде
/// # Порядок следования элементов в коде:
/// 1. <#MessageProtocol#>- протокол, описывающий сущность "Сообщение" +
/// 2. <#struct Message: MessageProtocol#> - структура, реализующая сущность протокола "Сообщение" +
/// 3. <#protocol StatisticDelegate: AnyObject#> - протокол, описывающий сущность "Менеджер статистики" +
/// 4. <#protocol MessengerProtocol#> - протокол, описывающий сущность "Мессенджер" +
/// 5. <#class Messenger: MessengerProtocol#> - класс, реализующая сущность "Мессенджер"
/// 6.<#extension Messenger: StatisticDelegate#> - расширяем сущность "Мессенджер" с помощью подписи на протокол "Менеджер статистики"
/// 7. <#var messenger#> - создаем экземпляр структуры "Мессенджер"
/// 8. <#messenger.statisticDelegate = messenger.self#>- присваиваем свойству экземпляра "Мессенджер" свой же экземпляр, содержащий реализацию протокола "Менеджер статистики"
/// 9. <#messenger.send#> - отправляем наше сообщение
///

// # - Выделяет текст
// <#> - делает системный шрифт