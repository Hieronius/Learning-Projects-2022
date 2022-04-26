// At start we will make a protocol of our "Contact" essence

protocol ContactProtocol {
    
    /// Имя
    var title: String { get set }
    /// Номер телефона
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    
    var title: String
    var phone: String
}
