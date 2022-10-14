//
//  ViewController.swift
//  Project 7
//
//  Created by Арсентий Халимовский on 27.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var petitionsOnHold = [Petition]()
    var filteredPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(getCredits))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterPetitions))
        
        // let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 1 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    self?.parse(json: data)
                    return
                }
            }
        }
        
        showError()
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Search", message: "write parameters for search", preferredStyle: .alert)
        ac.addTextField { (UITextField) in
            UITextField.placeholder = "Enter your parameters"
        }
        ac.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            self.petitionsOnHold = self.petitions
            
            let text = ac.textFields?.first?.text!
            
            for petition in self.petitions {
                if petition.title.contains(text!) {
                    self.filteredPetitions.append(petition)
                    
                }
            }
            print(self.filteredPetitions.first)
            self.petitions = self.filteredPetitions
            self.tableView.reloadData()
            
            
            
        })
        ac.addAction((UIAlertAction(title: "Refresh", style: .default, handler: { ActionHandler in
            self.petitions = self.petitionsOnHold
            self.tableView.reloadData()
        })))
                
        
        present(ac, animated: true)
    }
    
    // core of my function to filter petitions
//    for petition in self.petitions {
//        if petition.title.contains(text) {
//            self.filteredPetitions.append(petition)
//        }
//    }
    
    
    
    @objc func getCredits() {
        let ac = UIAlertController(title: "Credits", message: "The data comes from We are people API of the Whitehouse", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

