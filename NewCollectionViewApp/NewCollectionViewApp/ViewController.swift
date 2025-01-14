//
//  ViewController.swift
//  NewCollectionViewApp
//
//  Created by Арсентий Халимовский on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    

    

    @IBOutlet var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("There is \(movies.count) of movies")
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setup(with: movies[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 10
        cell.layer.borderWidth = 10
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.borderColor = UIColor.blue.cgColor
        print("Cell has been created")
        print("Size of the cell has been set")
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Size have been created")
        return CGSize(width: 200, height: 300)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(movies[indexPath.row].title)
        print("Movie \(movies[indexPath.row].title) been selected")
    }
}
