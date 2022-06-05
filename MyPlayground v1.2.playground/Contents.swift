import CoreGraphics
/// Type property

/* Global variables it's a variables that can be used in enywhere in the code
   Local variables free to use only in inflaence area like func or closure body.
 
   Property of type - it's a special property of class, stuct or enums and can't be blank or without value.
 
   Best idea to incapsulate global variables into the struct and if you need a specific variable just use a dot sintaxis */

struct MyGlobalVariables {
    
    static var firstVar = 1
    static var secondVar = 2
    static var thirdVar = 3
}

var myStructInstance = MyGlobalVariables()
var myArray = [MyGlobalVariables.firstVar, MyGlobalVariables.secondVar, MyGlobalVariables.thirdVar]


class FirstClass {
    var arraySortedLeft: [Int]
    
    func sortedFromLeftToRight() -> [Int] {
        return arraySortedLeft.sorted(by: {$0 > $1} )
        
        
}
    init(arraySortedLeft: [Int]) {
        self.arraySortedLeft = arraySortedLeft
    }
    
}

var fromFirstClass = FirstClass(arraySortedLeft: myArray)
fromFirstClass.sortedFromLeftToRight()
print(fromFirstClass.arraySortedLeft)


class SecondClass {
    var arraySortedRight: [Int]
    
    func sortedFromRightToLeft() -> [Int] {
        
        return arraySortedRight.sorted(by: {$0 > $1 })
    }
    
    init(arraySortedRight: [Int]) {
        self.arraySortedRight = arraySortedRight
    }
}

var fromSecondClass = SecondClass(arraySortedRight: myArray)
print(fromSecondClass.sortedFromRightToLeft())
//

class President {
    
    static var numberOfLegs = 2
    static var numberOfHands = 2
    
    var salary: Int
    var experience: Int
    
    init(salary: Int, experience: Int) {
        self.salary = salary
        self.experience = experience
    }
}

var MichailValerievich = President(salary: 100_000, experience: 25)


class VisePresident: President{
    
    static var MarkOfTheCar = "Audi"
    
    var amountOfSales: Int
    
    init(amountOfSales: Int, salary: Int, experience: Int) {
        self.amountOfSales = amountOfSales
        super.init(salary: salary, experience: experience)
    }
}

var VladimirAnatolievich = VisePresident(amountOfSales: 5_000_000, salary: 80_000, experience: 15)


print(MichailValerievich.experience)
print(MichailValerievich.salary)

print(VladimirAnatolievich.amountOfSales)
print(VladimirAnatolievich.salary)
print(VladimirAnatolievich.experience)

print(President.numberOfHands)
print(President.numberOfLegs)

print(VisePresident.MarkOfTheCar)


class Accountant {
    
    func calculateWork(array: [Int]) -> Int {
        return array.reduce(0, +)
    }
}

struct GlobalNumbers {
    static var number1 = 1
    static var number2 = 2
    static var number3 = 3
}

var globalArray = [GlobalNumbers.number1, GlobalNumbers.number2, GlobalNumbers.number3]

var MariaVladimirovna = Accountant()

print(MariaVladimirovna.calculateWork(array: globalArray))

// 4.

class Monster {
    
    static var minHeight = 100
    static var maxWeight = 300
    
    static var minWeaponPower = 100
    static var maxWeaponPower = 100
    
    static var counterOfMonsters = 0
    
    
    
    enum WeaponType: Int {
        case energyWeapon = 25
        case shootGundamage = 50
        case rocketLauncher = 75
        case bluntWeapon = 100
    }
    
    var name: String
    var breed: String
    var planetFrom: String
    var weapon: WeaponType {
        didSet {
            print("damage is now \(weapon.rawValue)")
            }
        }
    

    var height: Int {
        didSet {
            if height < Monster.minHeight {
                print("Invalid value, minimum height is 100")
                height = 100
            }
        }
    }
    var weight: Int {
        didSet {
            if weight > 300 {
                print("Invalid value, maximum weight is 300")
                weight = 300
            }
        }
    }
    
    
    init(name: String, breed: String, planetFrom: String, height: Int, weight: Int, weapon: WeaponType) {
        self.name = name
        self.breed = breed
        self.planetFrom = planetFrom
        self.height = height
        self.weight = weight
        self.weapon = weapon
        Monster.counterOfMonsters += 1
        
        
    }
    
}


Monster.counterOfMonsters
var myMonster = Monster(name: "Barka", breed: "Yallo", planetFrom: "Neptun", height: 90, weight: 350, weapon: .bluntWeapon)
Monster.counterOfMonsters
myMonster.weight = 400
myMonster.weight
myMonster.height = 90
myMonster.height

var newMonster = Monster(name: "Barka", breed: "Yallo", planetFrom: "Neptun", height: 90, weight: 350, weapon: .energyWeapon)
var newMonster1 = Monster(name: "Barka", breed: "Yallo", planetFrom: "Neptun", height: 90, weight: 350, weapon: .rocketLauncher)

Monster.counterOfMonsters

myMonster.weapon = .rocketLauncher
