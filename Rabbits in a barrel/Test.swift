

/*
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



 func getAndPutRabbit(firstBarrel: String?) {
    for barrel in newBarrelAndRabbitsTest {
        if barrel.0.number == Int(firstBarrel!)! {
            var newBarrel = barrel
            print("\(barrel.1.color) rabbit jumps out of the \(barrel.0.color) barrel № \(barrel.0.number)")
            newBarrel.0.number = Int.random(in: 1...9)
            print("and gets to \(newBarrel.0.color) barrel № \(newBarrel.0.number)")
        }
    }
    
    
}
print("Choose first barrel")
var a = readLine()
    

    


var counter1 = 0

while counter1 < 9 {
    
    getAndPutRabbit(firstBarrel: a)
    counter1 += 1
}

// I should think about func and tuples to change old barrel of rabbit to the new one
*/
