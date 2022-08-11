//
//  ViewController.swift
//  Memorize
//
//  Created by Арсентий Халимовский on 09.08.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    let dataSource = MemoryDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = dataSource
    }
    
    

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoryViewController") as? MemoryViewController else {
            fatalError("Unable to instantiate memory view controller")
        }
        
        let item = dataSource.item(at: indexPath.row)
        vc.memoryItem = item
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

