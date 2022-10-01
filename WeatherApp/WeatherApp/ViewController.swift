//
//  ViewController.swift
//  WeatherApp
//
//  Created by Арсентий Халимовский on 12.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let urlString = "http://api.apixu.com/v1/current.json?key=2fbcbca7114dd43fb82e1449491806018q=\(searchBar.text!)"
        
        let url = URL(string: urlString)
        
        var locationName: String?
        var temperature: Double?
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
            
            if let location = json["location"] as? String {
                locationName = location["name"] as? String
    }
            if let current = json["current"] {
                temperature = current["temp_c"] as? Double
            }
            catch var jsonError {
            print(jsonError)
        }
                
                task.resume()
    }
}
    }
}
