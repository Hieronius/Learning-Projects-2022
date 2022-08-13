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
        let urlString = "http://api.weatherapi.com/v1/current.json?key=46e527355e2741a393d92034221308&q=Moscow"
        
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
        }
        
        task.resume()
    }
}
