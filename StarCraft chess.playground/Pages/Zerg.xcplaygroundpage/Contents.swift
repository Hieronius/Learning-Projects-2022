class Zerg {
    
    var name: String
    var health: Int
    var producingTime: Int
    var damage: Int
    var defence: Int
    var specialAbilities: String
    var mineralCost: Int
    var gasCost: Int
    var specialPhrase: String
    
    func build() {
        print("\(name) is produced")
    }
    
    func action() {
        print("\(name) is ready to action")
    }
    
    init(name: String, health: Int, producingTime: Int, damage: Int, defence: Int, specialAbilities: String, mineralCost: Int, gasCost: Int, specialPhrase: String) {
        self.name = name
        self.health = health
        self.producingTime = producingTime
        self.damage = damage
        self.defence = defence
        self.specialAbilities = specialAbilities
        self.mineralCost = mineralCost
        self.gasCost = gasCost
        self.specialPhrase = specialPhrase
    }

}

var zergObject = Zerg(name: "Object", health: 100, producingTime: 100, damage: 100, defence: 100, specialAbilities: "none", mineralCost: 100, gasCost: 100, specialPhrase: "I'm the object")

zergObject.build()
zergObject.action()

class ZergBuildngs: Zerg {
    var size: Int
    
    override func build() {
        print("building complete")
        super.build()
    }
    
    override func action() {
        print("\(name) ready for work")
    }
    
    init(name: String, health: Int, producingTime: Int, damage: Int, defence: Int, specialAbilities: String, mineralCost: Int, gasCost: Int, specialPhrase: String, size: Int) {
        self.size = size
        super.init(name: name, health: health, producingTime: producingTime, damage: damage, defence: defence, specialAbilities: specialAbilities, mineralCost: mineralCost, gasCost: gasCost, specialPhrase: specialPhrase)
    }
    
}

var ultraliskLair = ZergBuildngs(name: "Ultralisk lair", health: 2000, producingTime: 150, damage: 0, defence: 3, specialAbilities: "none", mineralCost: 300, gasCost: 200, specialPhrase: "none", size: 200)

ultraliskLair.build()
ultraliskLair.action()
// Building class is done

class ZergEarthUnits: Zerg {
    
    var attackSpeed: Double
    
    override func build() {
        print("Earth war unit \(name) is ready to serve)")
    }
    
    override func action() {
        print("\(name) want some blood")
    }
    
    init(name: String, health: Int, producingTime: Int, damage: Int, defence: Int, specialAbilities: String, mineralCost: Int, gasCost: Int, specialPhrase: String, attackSpeed: Double) {
        self.attackSpeed = attackSpeed
        super.init(name: name, health: health, producingTime: producingTime, damage: damage, defence: defence, specialAbilities: specialAbilities, mineralCost: mineralCost, gasCost: gasCost, specialPhrase: specialPhrase)
    }
    
}
var ultralisk = ZergEarthUnits(name: "Ultralisk", health: 400, producingTime: 100, damage: 40, defence: 5, specialAbilities: "none", mineralCost: 350, gasCost: 250, specialPhrase: "Uuurra", attackSpeed: 1.0)

ultralisk.build()
ultralisk.action()


class ZergFlyUnits: Zerg {
    
    var speed: Double
    
    override func build() {
        print("Flying unit - \(name) is arrived")
    }
    
    override func action() {
        print("\(name) ready to action!")
    }
    
    init(name: String, health: Int, producingTime: Int, damage: Int, defence: Int, specialAbilities: String, mineralCost: Int, gasCost: Int, specialPhrase: String, speed: Double) {
        self.speed = speed
        super.init(name: name, health: health, producingTime: producingTime, damage: damage, defence: defence, specialAbilities: specialAbilities, mineralCost: mineralCost, gasCost: gasCost, specialPhrase: specialPhrase)
    }

}

var mutalisk = ZergFlyUnits(name: "Mutalisk", health: 150, producingTime: 80, damage: 9, defence: 0, specialAbilities: "none", mineralCost: 150, gasCost: 100, specialPhrase: "Uahh-uuuh", speed: 2.0)

mutalisk.build()
mutalisk.action()
