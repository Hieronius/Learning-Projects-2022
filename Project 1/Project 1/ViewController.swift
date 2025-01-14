//
//  ViewController.swift
//  Project 1
//
//  Created by Арсентий Халимовский on 12.09.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedApp))
        
        title = "Storm Viewer"
        
        performSelector(inBackground: #selector(getImages), with: nil)
        
        if !pictures.isEmpty {
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }
        
//        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        // print(pictures.sort())
    }
    
    @objc func getImages() {
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        pictures.sort()
        
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = pictures[indexPath.row]
            vc.title = "Picture \(pictures.firstIndex(of: (pictures[indexPath.row]))! + 1) of \(pictures.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func sharedApp() {
        
        let sharedLink = "Check this app - Storm Viewer!"
        let image = "📲"
        
        let vc = UIActivityViewController(activityItems: [sharedLink, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

