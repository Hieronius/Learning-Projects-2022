// Module name "Welcome" because this module supposed to meet user

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func showDate(date: String)
    func showWeather(weather: String)
    func showWindSpeed(windSpeed: String)
}

class ViewController: UIViewController {
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    
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
        }
    }
    
    func showWeather(weather: String) {
        DispatchQueue.main.async {
            self.weatherLabel.text = weather
        }
    }
    
    func showWindSpeed(windSpeed: String) {
        DispatchQueue.main.async {
            self.windSpeedLabel.text = windSpeed
        }
    }
    
    
}
