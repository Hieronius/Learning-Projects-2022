
import Foundation

class House {
    
    var width: Double
    var height: Double
    
    func build() {
        print("area is - \(width * height)")
    }
    
    func getWidth() {
        print("Width is - \(width)")
    }
    
    func getHeight() {
        print("Height is - \(height)")
    }
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
}

