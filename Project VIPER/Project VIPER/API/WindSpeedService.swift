

import Foundation

class WindSpeedService {
    func getWindSpeed(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let wind = 10 // Int.random(in: 0...20)
            completion(wind)
            print("breakpoint 1")
        }
    }
}
