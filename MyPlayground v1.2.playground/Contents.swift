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

func Goliafh(amountOfDamage: inout Int, typeOfTheAmmo: TypeOfTheAmmo, typeOfTheWeapon: TypesOfTheWeapon) {
    
    
    // types of ammo
    func chargeWithFireAmmo(damage: inout Int) {
        damage = damage + 15
        print("Goliath dealt \(damage) with fire ammo")
    }
    
    func chargeWithFrozenAmmo(damage: inout Int) {
        damage = damage + 25
        print("Goliath dealt \(damage) with frozen ammo")
    }
    
    func chargeWithElectricAmmo(damage: inout Int) {
        damage = damage + 35
        print("Goliath dealt \(damage) with electric ammo")
    }
    
    func chargeWithPenetrationAmmo(damage: inout Int) {
        damage = damage + 45
        print("Goliath dealt \(damage) with penetration ammo")
    }
    
    // types of weapon
    func attackWithGatlingGun(damage: inout Int) {
        damage = damage + 50
        print("Goliath dealt \(damage) with gatling gun")
    }
    
    func attackWithMissles(damage: inout Int) {
        damage = damage + 75
        print("Goliath dealt \(damage) with missles")
    }
    
    func attackWithLazerBeam(damage: inout Int) {
        damage = damage + 100
        print("Goliath dealt \(damage) with lazer beam")
    }
    
    func attackWithClaw(damage: inout Int) {
        damage = damage + 35
        print("Goliath dealt \(damage) with claw")
    }
    
    // selecting of weapon and type of ammo
    
    switch (typeOfTheAmmo, typeOfTheWeapon) {
        
    case (.fireAmmo, .gatlingGun):
        chargeWithFireAmmo(damage: &totallDamage)
        attackWithGatlingGun(damage: &totallDamage)
        
    case (.frozenAmmo, .gatlingGun):
        chargeWithFireAmmo(damage: &totallDamage)
        attackWithGatlingGun(damage: &totallDamage)
        
        ///
    }
}
var totallDamage = 0
