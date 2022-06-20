// Индексы

import Foundation
import UIKit




typealias Description = (coordinateX: Int, coordinateY: Int, color: String, place: String)


class Map {
    
    
    
    var mountains: Description = (1, 2, "red", "mountains")
    var river: Description = (5, 6, "green", "river")
    var custle: Description = (10, 11, "black", "custle")
    var wasteland: Description = (15, 16, "blue", "wasteland")
    var unknownPlace: Description = (20, 21, "yellow", "unknown place")
    

}

var map = Map()

class Hero {
    var name: String
    var currentPosition: Description {
        didSet {
            print("The current position right now is \(currentPosition.0), \(currentPosition.1), \(currentPosition.2)")
        
        }
    }
    
    func move(direction: String) {
        
        
        
        switch direction {
        case "Custle":
            currentPosition.self = map.custle
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) \(currentPosition.3)")
            
        case "Mountains":
            currentPosition.self = map.mountains
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) \(currentPosition.3)")
            
        case "River":
            currentPosition.self = map.river
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) \(currentPosition.3)")
            
        case "Wastelend":
            currentPosition.self = map.wasteland
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) \(currentPosition.3)")
            
        case "Unknown place":
            currentPosition.self = map.unknownPlace
            print("\(name.self) is currently in \(currentPosition.0), \(currentPosition.1) in the \(currentPosition.2) \(currentPosition.3)")

        default: break
        }
        
    }
    
    init(name: String, currentPosition: (Int, Int, String, String)) {
        self.name = name
        self.currentPosition = currentPosition
    }
    
}




var elves = Hero(name: "Elves", currentPosition: map.river)


var orcs = Hero(name: "Orcs", currentPosition: map.wasteland)


var demons = Hero(name: "Demons", currentPosition: map.unknownPlace)


var humans = Hero(name: "Humans", currentPosition: map.custle)


var dwarfs = Hero(name: "Dwarfs", currentPosition: map.mountains)


elves.move(direction: "Custle")



class Armies {
    var myArmies: [Hero] = []
    
    subscript(army: String) -> Hero {
        var choosenArmy: Hero
        
        for armies in myArmies {
            if armies.name == army {
                print("You choose the \(armies.name)")
                choosenArmy = armies
            }
        }
        return choosenArmy
    }
    
}

var legion = Armies()


legion.myArmies.append(elves)
legion.myArmies.append(orcs)
legion.myArmies.append(demons)
legion.myArmies.append(humans)
legion.myArmies.append(dwarfs)

/*
 
 for army in myArmy {
    if army.currentPosition == currentPosition {
        print("\(army.name) was attacked by \(name.self)")
    }
}
 
*/

