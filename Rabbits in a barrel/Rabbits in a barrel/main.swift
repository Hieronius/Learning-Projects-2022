
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
