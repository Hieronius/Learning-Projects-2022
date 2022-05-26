import UIKit

// Functions and closures

// Функция генерации случайного массива банкнот:
func generateWallet(walletLenght: Int) -> [Int] {
    // существующие типы банкнот:
    let typesOfBanknotes = [50, 100, 500, 1000, 5000]
    
    // массив банкнот
    var wallet: [Int] = []
    // цикл генерации массива случайных банкнот
    for _ in 1...walletLenght {
        wallet.append(typesOfBanknotes.randomElement()!)
    }
    return wallet
}

// Функция подсчета денег в кошельке
func sumWallet(banknotesFunction wallet: (Int) -> [Int], walletLenght: Int) -> Int? {
    
    // вызов переданной функции
    let myWalletArray = wallet(walletLenght)
    var sum: Int = 0
    for oneBanknote in myWalletArray {
        sum += oneBanknote
    }
    return sum
}

// Передача функции в функцию
sumWallet(banknotesFunction: generateWallet, walletLenght: 20)

/// function 3. Magician with left and right hand function


typealias Spell = (volumeOfSpellInSquareMeters: Int, speedOfSpellInMetresPerSecond: Int)

func spellCastingSession(numberOfCasts: Int)  -> [Spell] {
    
    var spellsDuringSession: [Spell] = []
    
    for _ in 1...numberOfCasts {
        spellsDuringSession.append((volumeOfSpellInSquareMeters: Int.random(in: 1...50), speedOfSpellInMetresPerSecond: Int.random(in: 1...50)))
       
    }
    
    return spellsDuringSession
    
}

var spells = spellCastingSession(numberOfCasts: 5)

func spellSessionTotalResult(ourFirstFunction spellSession: (Int) -> [Spell], numberOfCasts: Int) -> Int {
    
    var currentSpellSession = spellSession(numberOfCasts)
    var sum: Int = 0
    for spell in currentSpellSession {
        sum += (spell.0 + spell.1)
    }
    return sum
}

var totalSumOfScores = spellSessionTotalResult(ourFirstFunction: spellCastingSession(numberOfCasts:), numberOfCasts: 5)










///
func oneStep(coordinates: inout (Int, Int), stepType: String) -> Void {
    
    func up(coords: inout (Int, Int)) {
        coords = (coords.0+1, coords.1)
    }
    
    func right(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1+1)
    }
    
    func down(coords: inout (Int, Int)) {
        coords = (coords.0-1, coords.1)
    }
    
    func left(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1-1)
    }


switch stepType {
case "up":
    up(coords: &coordinates)
case "right":
    right(coords: &coordinates)
case "down":
    down(coords: &coordinates)
case "left":
    left(coords: &coordinates)
default:
    break
}

}

var coordinates = (10, -5)
oneStep(coordinates: &coordinates, stepType: "up")
oneStep(coordinates: &coordinates, stepType: "right")

///

// function that will select a special type of ammo and attack the target
// And depend of type of the ammo will be different damage and side effects

func attack(currentEnemyLife: inout Int, typeOftheAmmo: String) -> Void {
    
    func fireAmmo(enemyHP: inout Int) {
        enemyHP = enemyHP - 15
        print("Enemy was attacked with fire ammo and has \(enemyHP) HP now")
    }
    
    func frostAmmo(enemyHP: inout Int) {
        enemyHP = enemyHP - 20
        print("Enemy was frosen and he has \(enemyHP) HP now")
    }
    
    func electricAmmo(enemyHP: inout Int) {
        enemyHP = enemyHP - 25
        print("Enemy was shocked and he has \(enemyHP) HP now")
    }
    
    func armorPenetrationAmmo(enemyHP: inout Int) {
        enemyHP = enemyHP - 50
        print("Enemy's armor was destroyed and he has \(enemyHP) HP now")
    }
    
    switch typeOftheAmmo {
    case "fireAmmo":
        fireAmmo(enemyHP: &currentEnemyLife)
    case "frostAmmo":
    frostAmmo(enemyHP: &currentEnemyLife)
    case "electricAmmo":
        electricAmmo(enemyHP: &currentEnemyLife)
    case "armorPenetrationAmmo":
        armorPenetrationAmmo(enemyHP: &currentEnemyLife)
    default:
        break
}
}

var currentEnemyLife = 100
attack(currentEnemyLife: &currentEnemyLife, typeOftheAmmo: "fireAmmo")
attack(currentEnemyLife: &currentEnemyLife, typeOftheAmmo: "frostAmmo")
attack(currentEnemyLife: &currentEnemyLife, typeOftheAmmo: "electricAmmo")






enum TypeOfTheAmmo {
    case fireAmmo
    case electricAmmo
    case frozenAmmo
    case penetrationAmmo
}

enum TypesOfTheWeapon {
    case gatlingGun
    case missles
    case lazerBeam
    case claw
}

var totalDamage = 0
func Goliafh(totalDamage: inout Int, typeOfTheAmmo: TypeOfTheAmmo, typeOfTheWeapon: TypesOfTheWeapon) -> Void {
    
    
    // types of ammo
    func chargeWithFireAmmo(totalDamage: inout Int) {
        totalDamage = totalDamage + 15
        print("Goliath dealt \(totalDamage) with fire ammo")
    }
    
    func chargeWithFrozenAmmo(totalDamage: inout Int) {
        totalDamage = totalDamage + 25
        print("Goliath dealt \(totalDamage) with frozen ammo")
    }
    
    func chargeWithElectricAmmo(totalDamage: inout Int) {
        totalDamage = totalDamage + 35
        print("Goliath dealt \(totalDamage) with electric ammo")
    }
    
    func chargeWithPenetrationAmmo(totalDamage: inout Int) {
        totalDamage = totalDamage + 45
        print("Goliath dealt \(totalDamage) with penetration ammo")
    }
    
    // types of weapon
    func attackWithGatlingGun(totalDamage: inout Int) {
        totalDamage = totalDamage + 50
        print("Goliath dealt \(totalDamage) with gatling gun")
    }
    
    func attackWithMissles(totalDamage: inout Int) {
        totalDamage = totalDamage + 75
        print("Goliath dealt \(totalDamage) with missles")
    }
    
    func attackWithLazerBeam(totalDamage: inout Int) {
        totalDamage = totalDamage + 100
        print("Goliath dealt \(totalDamage) with lazer beam")
    }
    
    func attackWithClaw(totalDamage: inout Int) {
        totalDamage = totalDamage + 35
        print("Goliath dealt \(totalDamage) with claw")
    }
    
    // selecting of weapon and type of ammo
    
    switch (typeOfTheAmmo, typeOfTheWeapon) {
        
    case (.fireAmmo, .gatlingGun):
        chargeWithFireAmmo(totalDamage: &totalDamage)
        attackWithGatlingGun(totalDamage: &totalDamage)
        totalDamage = totalDamage + 50
        print("This is powerfull hit!")
        
        
    case (.frozenAmmo, .gatlingGun):
        chargeWithFireAmmo(totalDamage: &totalDamage)
        attackWithGatlingGun(totalDamage: &totalDamage)
        totalDamage = totalDamage * 2
        print("That was a massive damage")
        
        
    case (.electricAmmo, .gatlingGun):
        chargeWithElectricAmmo(totalDamage: &totalDamage)
        attackWithGatlingGun(totalDamage: &totalDamage)
        
    case (.penetrationAmmo, .gatlingGun):
        chargeWithPenetrationAmmo(totalDamage: &totalDamage)
        attackWithGatlingGun(totalDamage: &totalDamage)
        ///
    
    case (.fireAmmo, .missles):
        chargeWithFireAmmo(totalDamage: &totalDamage)
        attackWithMissles(totalDamage: &totalDamage)
        
    case (.frozenAmmo, .missles):
        chargeWithFrozenAmmo(totalDamage: &totalDamage)
        attackWithMissles(totalDamage: &totalDamage)
        
    case (.electricAmmo, .missles):
        chargeWithElectricAmmo(totalDamage: &totalDamage)
        attackWithMissles(totalDamage: &totalDamage)
        
    case (.penetrationAmmo, .missles):
        chargeWithPenetrationAmmo(totalDamage: &totalDamage)
        attackWithMissles(totalDamage: &totalDamage)
        ///
    
    case (.fireAmmo, .lazerBeam):
        chargeWithFireAmmo(totalDamage: &totalDamage)
        attackWithLazerBeam(totalDamage: &totalDamage)
        
    case (.frozenAmmo, .lazerBeam):
        chargeWithFrozenAmmo(totalDamage: &totalDamage)
        attackWithLazerBeam(totalDamage: &totalDamage)
        
    case (.electricAmmo, .lazerBeam):
        chargeWithElectricAmmo(totalDamage: &totalDamage)
        attackWithLazerBeam(totalDamage: &totalDamage)
        
    case (.penetrationAmmo, .lazerBeam):
        chargeWithPenetrationAmmo(totalDamage: &totalDamage)
        attackWithLazerBeam(totalDamage: &totalDamage)
        ///
    
    case (.fireAmmo, .claw):
        chargeWithFireAmmo(totalDamage: &totalDamage)
        attackWithClaw(totalDamage: &totalDamage)
        
    case (.frozenAmmo, .claw):
        chargeWithFrozenAmmo(totalDamage: &totalDamage)
        attackWithClaw(totalDamage: &totalDamage)
        
    case (.electricAmmo, .claw):
        chargeWithElectricAmmo(totalDamage: &totalDamage)
        attackWithClaw(totalDamage: &totalDamage)
        
    case (.penetrationAmmo, .claw):
        chargeWithPenetrationAmmo(totalDamage: &totalDamage)
        attackWithClaw(totalDamage: &totalDamage)
default:
    break
    }
    

    
}



Goliafh(totalDamage: &totalDamage, typeOfTheAmmo: .fireAmmo, typeOfTheWeapon: .gatlingGun)
Goliafh(totalDamage: &totalDamage, typeOfTheAmmo: .electricAmmo, typeOfTheWeapon: .missles)
Goliafh(totalDamage: &totalDamage, typeOfTheAmmo: .frozenAmmo, typeOfTheWeapon: .lazerBeam)
Goliafh(totalDamage: &totalDamage, typeOfTheAmmo: .penetrationAmmo, typeOfTheWeapon: .claw)
Goliafh(totalDamage: &totalDamage, typeOfTheAmmo: .frozenAmmo, typeOfTheWeapon: .gatlingGun)



// outer function
func greetMessage() {
    
    // inner function
    func displayName() {
        print("Good Morning Abraham!")
    }
    
    // calling inner function
    displayName()
}

greetMessage()


// nested function with parameters

// outer function
func addNumbers() {
    print("Addition")
    
    // inner function
    func display(num1: Int, num2: Int) {
        print("5 + 10 =", num1 + num2 )
    }
    
    // calling inner function with two values
    display(num1: 5, num2: 10)
}

// calling outer function
addNumbers()


// nested function with Return Values

func operate(symbol: String) -> (Int, Int) -> Int {
    
    // inner function to add two numbers
    func add(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    
    // inner function to substract two numbers
    func subtract(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    
    let operation = (symbol == "+") ? add: subtract
    return operation
}

let operation = operate(symbol: "+")
let result = operation(8,3)
