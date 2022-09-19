// Module name "Welcome" because this module supposed to meet user

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)
    func showWindSpeed(wind: String)
    func showPressure(pressure: String)
}

class ViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel! // open date on storyboard
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    
    @IBOutlet var pressureLabel: UILabel!
    
    
    var presenter: WelcomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
    }

    @IBAction func didTapedImageButton(_ sender: Any) {
        presenter?.didTapImageButton()
    }
    
    @IBAction func didTapedWindSpeedButton(_ sender: Any) {
        presenter?.didTapWindSpeedButton()
    }
    
}

extension ViewController: WelcomeViewProtocol {
    func showDate(date: String) {
        DispatchQueue.main.async {
            self.dateLabel.text = date
            print("date breakpoint 1")
        }
    }
    
    func showWeather(weather: String) {
        DispatchQueue.main.async {
            self.weatherLabel.text = weather
            print("weather breakpoint 1")
        }
    }
    
    func showWindSpeed(wind: String) {
        DispatchQueue.main.async {
            self.windLabel.text = wind
            print("breakpoint4")
        }
    }
    
    func showPressure(pressure: String) {
        DispatchQueue.main.async {
            self.pressureLabel.text = pressure
        }
    }
    
    
}
