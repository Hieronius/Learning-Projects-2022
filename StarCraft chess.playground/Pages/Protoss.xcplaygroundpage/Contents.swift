// Trying to use protocols here or smart classes without useless properties like damage for buildings


/// global protocol for whole race
protocol Protoss {
    
    var name: String { get set }
    var mineralCost: Int { get set }
    var vespenCost: Int { get set }
    var producingTime: Int { get set }
    var health: Int { get set }
    var sheild: Int { get set }
    
    func build()
    
    func action()
}

/// class for Protos buildings
class ProtossBuilding: Protoss {
    
    var name: String
    var mineralCost: Int
    var vespenCost: Int
    var producingTime: Int
    var health: Int
    var sheild: Int
    
    var upgraidsAvaliable: [String]
    var defence: Int
    
    func build() {
        print("\(name) is builded")
    }
    
    func action() {
        print("\(name) is ready for work")
    }
    
    init(
        name: String,
        mineralCost: Int,
        vespenCost: Int,
        producingTime: Int,
        upgraidsAvaliable: [String],
        defence: Int,
        health: Int,
        sheild: Int) {
            
        self.name = name
        self.mineralCost = mineralCost
        self.vespenCost = vespenCost
        self.producingTime = producingTime
        self.upgraidsAvaliable = upgraidsAvaliable
        self.defence = defence
        self.health = health
        self.sheild = sheild
    }
}

var ciberneticCore = ProtossBuilding(
    name: "Cibernetic core",
    mineralCost: 200,
    vespenCost: 0,
    producingTime: 200,
    upgraidsAvaliable: ["Weapon mastery", "Sheild mastery", "Armor mastery"],
    defence: 1,
    health: 800,
    sheild: 800)

ciberneticCore.build()
ciberneticCore.action()

/// extension to protocol Protoss
extension Protoss {
    
    func checkItOut() {
        print("Check it out")
    }
}

/// class for Protoss army
class ProtossArmy: Protoss {
    
    // Posible to add special var for full or halfed damage depends of armor type
    var name: String
    var mineralCost: Int
    var vespenCost: Int
    var producingTime: Int
    var health: Int
    var sheild: Int
    
    var damage: Int
    var armor: Int
    var specialPhrase: String
    
    var antiAirDamage: Int?
    var subUnits: Int?
    var energy: Int?
    var specialAbilities: [String?]
    
    func build() {
        print("\(name) is produced")
    }
    
    func action() {
        print("\(name) is ready to serve")
    }
    
    init(
        name: String,
        mineralCost: Int,
        vespenCost: Int,
        producingTime: Int,
        health: Int,
        sheild: Int,
        damage: Int,
        armor: Int,
        antiAirDamage: Int?,
        subUnits: Int?,
        specialPhrase: String,
        energy: Int?,
        specialAbilities: [String?]) {
            
        self.name = name
        self.mineralCost = mineralCost
        self.vespenCost = vespenCost
        self.producingTime = producingTime
        self.health = health
        self.sheild = sheild
        self.damage = damage
        self.armor = armor
        self.antiAirDamage = antiAirDamage
        self.subUnits = subUnits
        self.specialPhrase = specialPhrase
        self.energy = energy
        self.specialAbilities = specialAbilities
    }
    
}

var protossWarUnit = ProtossArmy(
    name: "War unit",
    mineralCost: 200,
    vespenCost: 200,
    producingTime: 200,
    health: 200,
    sheild: 200,
    damage: 200,
    armor: 200,
    antiAirDamage: 200,
    subUnits: 200,
    specialPhrase: "War unit ready to fight!",
    energy: 200,
    specialAbilities: ["Void"])

protossWarUnit.build()
protossWarUnit.action()

// Basic protocol and classes done. So i should make specific classes like heroes, flying units, earth units and etc. Add specific properties like "special ablitilies", "energy", and others.

class ProtossFlyingWarUnit: ProtossArmy {
    
    var flyingSpeed: Double
    var cargo: Int?
    
    override func build() {
        print("Flying unit - \(name) is produced")
    }
    
    override func action() {
        print("\(name) has arrived")
    }
    
    init(
        name: String,
        mineralCost: Int,
        vespenCost: Int,
        producingTime: Int,
        health: Int,
        sheild: Int,
        damage: Int,
        armor: Int,
        antiAirDamage: Int?,
        subUnits: Int?,
        specialPhrase: String,
        energy: Int?,
        specialAbilities: [String?],
        flyingSpeed: Double,
        cargo: Int?) {
            
        self.flyingSpeed = flyingSpeed
        self.cargo = cargo
            
        super.init(
            name: name,
            mineralCost: mineralCost,
            vespenCost: vespenCost,
            producingTime: producingTime,
            health: health,
            sheild: sheild,
            damage: damage,
            armor: armor,
            antiAirDamage: antiAirDamage,
            subUnits: subUnits,
            specialPhrase: specialPhrase,
            energy: energy,
            specialAbilities: specialAbilities)
    }
    
}

var carrier = ProtossFlyingWarUnit(name: "Carrier",
                                   mineralCost: 350,
                                   vespenCost: 250,
                                   producingTime: 150, health: 350,
                                   sheild: 150,
                                   damage: 10,
                                   armor: 3,
                                   antiAirDamage: 10,
                                   subUnits: 8,
                                   specialPhrase: "Carrier has arrived",
                                   energy: nil,
                                   specialAbilities: [nil],
                                   flyingSpeed: 0.9,
                                   cargo: nil)

carrier.build()
carrier.action()

var protossArmy: [Protoss] = [protossWarUnit, carrier]
