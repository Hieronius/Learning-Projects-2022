
import Foundation

class House {
    
    var width: String?
    var height: String?
    
    func build() {
        print("area is - \(Int(width!)! * Int(height!)!) ")
    }
    
    func getWidth() {
        print("Width is - \(width!)")
    }
    
    func getHeight() {
        print("Height is - \(height!)")
    }
    
    init(width: String?, height: String?) {
        self.width = width
        self.height = height
    }
}

print("Введите ширину")
var a = readLine()
print("Введите высоту")
var b = readLine()

var objectSquare = House(width: a, height: b)

print("Характеристики дома такие:")
objectSquare.build()
objectSquare.getWidth()
objectSquare.getHeight()


