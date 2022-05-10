// Тип задачи
enum TaskPriority {
    // текущая
    case normal
    // важная
    case important
}

// Состояние задачи
enum TaskStatus: Int {
    // запланированная
    case planned
    // завершенная
    case completed
}

// Требования к типу, описывающему сущность "Задача"
protocol TaskProtocol {
    // название
    var title: String { get set }
    // тип
    var type: TaskPriority { get set }
    // статус
    var status: TaskStatus { get set }
    
}

// Сущность "Задача"
struct Task: TaskProtocol {
    var title: String
    var type: TaskPriority
    var status: TaskStatus
}
