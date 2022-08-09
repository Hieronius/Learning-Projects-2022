//
//  ViewController.swift
//  Memorize
//
//  Created by Арсентий Халимовский on 09.08.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [MemoryItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadItems()
    }
    
    func loadItems() {
        guard let url = Bundle.main.url(forResource: "Items", withExtension: "json") else {
                    fatalError("Can't find JSON.")
                }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("Failed to decode JSON")
        }
        
        items = savedItems
    }

    override func tableView(_ tableVIew: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableVIew(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.text
        
        return cell
    }

}

