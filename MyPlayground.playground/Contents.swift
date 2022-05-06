// practice with classes and methods

// class 1

class Account {
    
    var capital: Double {
        willSet (newCapital) {
            print("Старая сумма вклада \(self.capital) новая сумма \(newCapital)")
        }
        didSet (oldCapital) {
            print("Сумма вклада увеличена на \(self.capital - oldCapital)")
        }
    }// сумма вклада
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

myAcc.capital = 1200

// Ожидаемая прибыль
myAcc.profit = 1210
print(myAcc.capital) // 1100 - необходимая сумма вклада для получения этой прибыли

















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
    
    var totalPower: Int { // computed property "read and write"
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



// class 3
class Dwarf {
    
    var name: String // stored property
    var stamina: Int
    
    lazy var luck: Int = Int.random(in: 1...50)
    
    lazy var strongestHit: Int = { () -> Int in
        stamina * health
    }()
   
    
    var health: Int {
        get {
            stamina * 10
        }
        
        set(newValue) {
            stamina = newValue / 10
            
        }
        
        
    }
    
    var currentLevel: Int {
        willSet(newLevel) {
            print("Old level is \(currentLevel). New current level is \(newLevel)")
        }
        didSet(oldLevel) {
            print("hero got \(currentLevel - oldLevel) levels")
        }
    }
    
    
    func probabilityToCatchTrap() {
        if luck > 25 {
            print("Trap avoided successfully")
        } else {
            print("Hero being traped")
        }
    }
    
    init(name: String, stamina: Int, currentLevel: Int) {
        self.name = name
        self.stamina = stamina
        self.currentLevel = currentLevel
    }
    
    
}

var myDwarfHero = Dwarf(name: "Jabra", stamina: 10, currentLevel: 1)
myDwarfHero.currentLevel = 5
myDwarfHero.health
myDwarfHero.stamina
myDwarfHero.luck
myDwarfHero.probabilityToCatchTrap()
myDwarfHero.probabilityToCatchTrap()
myDwarfHero.strongestHit
myDwarfHero.stamina = 20
myDwarfHero.strongestHit

// Done with computed, stored and observers with lazy properties. Let's do elf, orc, giant and lisard classes with the same system.


