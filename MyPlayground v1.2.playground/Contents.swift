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
    var name = "Gendalf"
    var currentPosition: Description = (50, 50, "purple") {
        didSet {
            print("The current position right now is \(currentPosition.coordinateX), \(currentPosition.coordinateY), \(currentPosition.color)")
        }
    }
    
    func move() {
        
        var newPosition: Description = (0, 0, "")
        
        
    }
}
