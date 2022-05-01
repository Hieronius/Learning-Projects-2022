// 5-10 structs

struct Car {
    var price: Int
    var weight: Int
    var yearOfProduce: Int
    var name: String
    var engine: Double
}

struct myOutFitBag {
    var phone = "Iphone"
    var tablet = "Ipad"
    var laptop = "MacBook"
    var pen = "Apple pencil"
    var headPhones = "Beats solo 3"
    var player = "Iphone 6s"
}

struct myOutfit {
    var uppedBody = "T-shirt"
    var lowerBody = "Shorts"
    var underwear = "boxer briefs"
    var shoes = "Reebok fly"
    var sunglasses = "hunder rubles sunglasses"
    var assesories = ["stil chain", "stil ring", "apple watch"]
    
}

struct myNotes {
    var firstFolder = "Managment"
    var secondFolder = "Self-development"
    var thirthFolder = "Sales"
    var fourthFolder = "Fitness"
    var fivethFolder = "Psychology"
}

struct myChar {
    var strenght = 15
    var intellect = 10
    var agility = 15
    var vitality = 25
    var stamina = 55
    var charisma = 25
}

struct TerranArmy {
    var soldier = "Space marine"
    var spy = "Ghost"
    var commander = "Jim Rainor"
    var machine = "Goliaf"
    var flyMachine = "Battle Cruiser"
    var commandCentre = "Braxis"
}

struct myResume {
    var age: Int
    var namy: String
    var experience: Int
    var specialisation: String
    var hasCar: Bool
    var isMarried: Bool
    var countryFrom: String
    var preferedLanguage: String
    
}

struct Building {
    var height: Int
    var weight: Int
    var cost: Int
    var stages: Int
    var location: String
    var goodArea: Bool
    var isMortageAvaliable: Bool
    var parkingIncludes: Bool
}

struct Ammunition {
    var steelArms = "Machete"
    var pistol = "Magnum"
    var rifle = "Kalashnikov"
    var granade = "M22"
    var car = "Hammer"
    var opticalVision = "infrared sight"
}


struct Point: Equatable {
    var x: Int
}

struct X {
    var point: Point {
        didSet { point.x = 0}
    }
}

let y = Point(x: 5)
let p = X(point: y)

let result = p.point.x == y.x
print(result)
