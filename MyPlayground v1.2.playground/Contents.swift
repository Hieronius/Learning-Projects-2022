// Индексы


typealias Description = (coordinateX: Int, coordinateY: Int, color: String)


class Map {
    
    
    
    var mountain: Description = (1, 2, "red")
    var river: Description = (5, 6, "green")
    var custle: Description = (10, 11, "black")
    var wasteland: Description = (15, 16, "blue")
    var unknownPlace: Description = (20, 21, "yellow")
    

}

var map = Map()

class Hero {
    var name: String
    var currentPosition: Description = (50, 50, "purple") {
        didSet {
            print("The current position right now is \(currentPosition.coordinateX), \(currentPosition.coordinateY), \(currentPosition.color)")
        }
    }
    
    func move(direction: String) {
        
        
        
        switch direction {
        case "Custle":
            currentPosition.self = map.custle
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) custle")
            
        case "Mountain":
            currentPosition.self = map.mountain
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) mountain)")
            
        case "River":
            currentPosition.self = map.river
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) river)")
            
        case "Wastelend":
            currentPosition.self = map.wasteland
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) wasteland)")
            
        case "Unknown place":
            currentPosition.self = map.unknownPlace
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) unknown place)")

        default: break
        }
        
    }
    
    init(name: String) {
        self.name = name
    }
    
}




var elves = Hero(name: "Elves")
elves.move(direction: "River")

var orcs = Hero(name: "Orcs")
orcs.move(direction: "Westlend")

var demons = Hero(name: "Demons")
demons.move(direction: "Unknown place")

var humans = Hero(name: "Humans")
humans.move(direction: "Custle")

var dwarfs = Hero(name: "Dwarfs")
dwarfs.move(direction: "Mountain")

var myArmy = [elves, orcs, demons, humans, dwarfs]

elves.move(direction: "Custle")


/*
 for army in myArmy {
    if army.currentPosition == currentPosition {
        print("\(army.name) was attacked by \(name.self)")
    }
}
 
*/
