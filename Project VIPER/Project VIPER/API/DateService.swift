

import Foundation

class DateService {
    func getDate(completion: @escaping (Date) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        completion(Date())
    }
  }
}
