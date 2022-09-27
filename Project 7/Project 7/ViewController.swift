//
//  ViewController.swift
//  Project 7
//
//  Created by Арсентий Халимовский on 27.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }
}

