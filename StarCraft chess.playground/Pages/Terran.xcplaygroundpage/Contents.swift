// Classes
class Terran {
    var health: Int
    var name: String
    
    func build() {
        print("\(name) is builded")
    }
    
    func action() {
        print("\(name) is arrived")
    }
    
    
    init(health: Int, name: String) {
        self.health = health
        self.name = name
    }
}

var terranObject = Terran(health: 1000, name: "Building")
terranObject.build()
terranObject.action()

class TerranArmy: Terran {
    var damage: Int
    
    override func build() {
        super.build()
        print("Producing of \(name) is complete")
    }
    
    override func action() {
        super.action()
        print("\(name) ready to action!")
    }
    
    init(health: Int, name: String, damage: Int) {
        self.damage = damage
        super.init(health: health, name: name)
    }
}

var terranMarine = TerranArmy(health: 40, name: "Marine", damage: 5)
terranMarine.build()
terranMarine.action()

class TerranArmyMachine: TerranArmy {
    var antiAir: Bool
    
    override func build() {
        super.build()
        print("Current upgraids is 0/0")
    }
    
    override func action() {
        super.action()
        print("Give me a target!")
    }
    
    init(health: Int, name: String, damage: Int, antiAir: Bool) {
        self.antiAir = antiAir
        super.init(health: health, name: name, damage: damage)
    }
}

var terranSiegeTank = TerranArmyMachine(health: 150, name: "Siege tank", damage: 25, antiAir: false)
terranSiegeTank.build()
terranSiegeTank.action()

class TerranArmyAirMachine: TerranArmyMachine {
    var speed: Double
    
    override func build() {
        super.build()
        print("Upgraid is avaliable")
    }
    
    override func action() {
        super.action()
        print("all frequencies are working")
    }
    
    init(health: Int, name: String, damage: Int, antiAir: Bool, speed: Double) {
        self.speed = speed
        super.init(health: health, name: name, damage: damage, antiAir: antiAir)
    }
}

var terranValkyrie = TerranArmyAirMachine(health: 200, name: "Valkyrie", damage: 15, antiAir: true, speed: 20.0)
terranValkyrie.build()
terranValkyrie.action()
