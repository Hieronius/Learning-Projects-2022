// practice with classes and methods

// class 1

class Account {
    
    var capital: Double = 0 // сумма вклада
    var rate: Double = 0.01 // Процентная ставка
    
    var profit: Double {
        
        get {
            return capital + capital * rate
        }
        
        set(newProfit) {
            self.capital = newProfit / (1 + rate)
        }
    }
    
    init(capital: Double, rate: Double) {
        
        self.capital = capital
        self.rate = rate
    }
    
    
}

var myAcc = Account(capital: 1000, rate: 0.1)
print(myAcc.profit)

// Ожидаемая прибыль
myAcc.profit = 1210
print(myAcc.capital) // 1100 - необходимая сумма вклада для получения этой прибыли

myAcc.profit = 1500
print(myAcc.capital)


















// class 2.

class Human {
    
    var firstName: String // stored property
    var lastName: String
    
    var strenght: Int
    var agility: Int
    var vitality: Int
    
    var currentLevel = 0
    var spiriteLevel = 0
    
    var defence: Int { // computed property "read only"
        agility / 10
    }
    
    var stamina: Int {
        vitality * 5
    }
    
    var attackPower: Int {
        strenght * 2
    }
    
    var totalPower: Int {
        get {
            strenght + agility + vitality
        }
        set(newValue) {
            self.spiriteLevel = newValue / 3
            
        }
        
    }
    
    lazy var name: String = self.generateWholeName() // lazy property
    
    func generateWholeName() -> String { // method for lazy property
        return firstName + " " + lastName
    }
    
    func newLevel() {  // method of class
        self.strenght = strenght + 5
        self.agility = agility + 5
        self.vitality = vitality + 5
        currentLevel += 1
    }
    
    
    init(
        firstName: String,
        lastName: String,
        strenght: Int,
        agility: Int,
        vitality: Int) {
            
            self.firstName = firstName
            self.lastName = lastName
            self.strenght = strenght
            self.agility = agility
            self.vitality = vitality
            
        }
}

var myHero = Human(firstName: "Jim", lastName: "Reinor", strenght: 15, agility: 20, vitality: 20)
myHero.totalPower
myHero.totalPower = 110
myHero.spiriteLevel
myHero.totalPower = 220
myHero.spiriteLevel

// Founded how to make get/set with stored property.
// In this case get will give us value of totalPower
// set will give us value of spiritLevel that depend of totalPower
// Tomorrow i should make more examples on this area or make more classes with a very few properties




