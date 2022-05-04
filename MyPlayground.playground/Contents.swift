// practice with classes and methods

// class 1

class Human {
    
    var firstName: String // stored property
    var lastName: String
    
    var strenght: Int
    var agility: Int
    var vitality: Int
    
    var currentLevel = 0
    
    var defence: Int { // computed property
        agility / 10
    }
    
    var stamina: Int {
        vitality * 5
    }
    
    var attackPower: Int {
        strenght * 2
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
myHero.vitality
myHero.agility
myHero.strenght
myHero.attackPower
myHero.defence
myHero.stamina

myHero.generateWholeName()

myHero.defence

myHero.newLevel()
myHero.strenght
myHero.agility
myHero.vitality


myHero.newLevel()
myHero.strenght
myHero.agility
myHero.vitality
myHero.currentLevel
