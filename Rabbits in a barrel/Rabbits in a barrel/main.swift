
import Foundation

struct Rabbit {
    var color: String
}

struct Barrel {
    var color: String
    var number: Int
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

var arrayOfnewRabbits: [Rabbit] = []

var counter = 0

while counter < 9 {
    
    print("Choose your barrel")
    var b = readLine()



    for barrel in newBarrelAndRabbitsTest {
        if barrel.0.number == Int(b!)! {
            arrayOfnewRabbits.append(barrel.1)
            print("\(barrel.1.color) rabbit jumps out of the \(barrel.0.color) barrel")
        }
    }
    counter += 1
}

print(arrayOfnewRabbits[0...8])

// First part of the work done. You can choose all barrels and take all of possible rabbits.


