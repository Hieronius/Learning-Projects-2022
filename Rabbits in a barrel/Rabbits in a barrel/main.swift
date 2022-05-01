
import Foundation

//func sum(firstNumber a: String?, secondNumber b: String?) -> Int {
//    return Int(a!)! + Int(b!)!
//}
//
//print("Enter first number")
//var a = readLine()
//print("Enter second number")
//var b = readLine()
//print(sum(firstNumber: a, secondNumber: b))

struct Rabbit {
    var color: String
}

struct Barrel {
    var color: String
    var number: Int
}

var arrayOfRabbits = [Rabbit(color: "Red"), Rabbit(color: "Black"), Rabbit(color: "Purple"), Rabbit(color: "White"), Rabbit(color: "Brown"), Rabbit(color: "Yellow"), Rabbit(color: "Green"), Rabbit(color: "Blue"), Rabbit(color: "Orange")]

var arrayOfBarrel = [Barrel(color: "Red", number: 1), Barrel(color: "Black", number: 2), Barrel(color: "Purple", number: 3), Barrel(color: "White", number: 4), Barrel(color: "Brown", number: 5), Barrel(color: "Yellow", number: 6), Barrel(color: "Green", number: 7), Barrel(color: "Blue", number: 8), Barrel(color: "Orange", number: 9)]

var barrel1 = Barrel(color: "Cristall", number: 10)

print("Color is \(barrel1.color) and number is \(barrel1.number)")

print("Choose your barrel")
var a = readLine()

for barrel in arrayOfBarrel {
    if barrel.number == Int(a!)! {
        print("color of your barrel is \(barrel.color)")
    }
}

typealias BarrelsAndRabbitsTest = (Barrel,Rabbit)
var newBarrelAndRabbitsTest = [
     (Barrel(color: "Red", number: 1), Rabbit(color: "Red")),
     (Barrel(color: "Black", number: 2), Rabbit(color: "Black")),
     (Barrel(color: "Purple", number: 3), Rabbit(color: "Purple")),
     (Barrel(color: "White", number: 4), Rabbit(color: "White")),
     (Barrel(color: "Brown", number: 5), Rabbit(color: "Brown")),
     (Barrel(color: "Yellow", number: 6), Rabbit(color: "Yellow")),
     (Barrel(color: "Green", number: 7), Rabbit(color: "Green")),
     (Barrel(color: "Blue", number: 8), Rabbit(color: "Blue")),
     (Barrel(color: "Orange", number: 9), Rabbit(color: "Orange"))]

struct BarrelsAndRabbits {
    var barrelColor: String
    var rabbitColor: String
    var barrelNumber: Int
}

var arrayOfBarrelWithRabbits = [
BarrelsAndRabbits(barrelColor: "Red", rabbitColor: "Purple", barrelNumber: 1),
BarrelsAndRabbits(barrelColor: "White", rabbitColor: "Black", barrelNumber: 2),
BarrelsAndRabbits(barrelColor: "Brown", rabbitColor: "White", barrelNumber: 3),
BarrelsAndRabbits(barrelColor: "Yellow", rabbitColor: "Red", barrelNumber: 4),
BarrelsAndRabbits(barrelColor: "Green", rabbitColor: "Brown", barrelNumber: 5),
BarrelsAndRabbits(barrelColor: "Black", rabbitColor: "Yellow", barrelNumber: 6),
BarrelsAndRabbits(barrelColor: "Purple", rabbitColor: "Blue", barrelNumber: 7),
BarrelsAndRabbits(barrelColor: "Blue", rabbitColor: "Orange", barrelNumber: 8),
BarrelsAndRabbits(barrelColor: "Orange", rabbitColor: "Green", barrelNumber: 9)]

var arrayOfnewRabbits: [Rabbit] = []

print("Choose your barrel")
var b = readLine()
print("Choose your second barrel")
var c = readLine()

for barrel in newBarrelAndRabbitsTest {
    if barrel.0.number == Int(b!)! || barrel.0.number == Int(c!)! {
        arrayOfnewRabbits.append(barrel.1)
        print("\(barrel.1.color) rabbit jumps out of the \(barrel.0.color) barrel")
    }
}
print(arrayOfnewRabbits)

// I should implement switch to "var a = readline" so i can have only 1 string of if else instead of 9
