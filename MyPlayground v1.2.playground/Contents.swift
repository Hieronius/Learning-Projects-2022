
// War game from Samoilov

class Human {
    
    var health: Int
    var weaponDamage: Int
    
    init(health: Int, weaponDamage: Int) {
        self.health = health
        self.weaponDamage = weaponDamage
    }
}

class Ork: Human {
    override var health: Int {
        didSet {
            print("Health is not \(health)")
        }
    }
    
    
}

class Elf: Human {
    override var weaponDamage: Int {
        didSet {
            print("Weapon damage is increased and now equal \(weaponDamage). Time to buy new armor!")
        }
    }
    
    
}

var ork = Ork(health: 100, weaponDamage: 10)
var elf = Elf(health: 50, weaponDamage: 15)

ork.health = 90
elf.weaponDamage = 20

