

class Bank {
    var userFirstName: String
    var userLastName: String
    
    lazy var fullName: String = { () -> String in
        userFirstName + " " + userLastName
    }()
    
    var currentMoney: Double {
        willSet(newCurrentMoney) {
            print("Было на счету \(self.currentMoney) а стало \(newCurrentMoney)")
        }
        didSet(oldCurrentMoney){
            print("Сумма увеличилась на \(currentMoney - oldCurrentMoney)")
        }
    }
    var typeOfMoney: String
    
    var currentInterestRate: Double
    
    var profit: Double {
        get {
            currentMoney * currentInterestRate
        }
        set(newProfit) {
            self.currentMoney = newProfit / currentInterestRate
        }
    }
    
    init(userFirstName: String, userLastName: String, currentMoney: Double, typeOfMoney: String, currentInterestRate: Double) {
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.currentMoney = currentMoney
        self.typeOfMoney = typeOfMoney
        self.currentInterestRate = currentInterestRate
    }
    
}

var myBankAccount = Bank(userFirstName: "Arsenty", userLastName: "Khalimovsky", currentMoney: 200_000, typeOfMoney: "Rubles", currentInterestRate: 15.0)
myBankAccount.fullName
myBankAccount.profit
myBankAccount.profit = 350_000
myBankAccount.currentMoney

class AlfaBank: Bank {
    
}
