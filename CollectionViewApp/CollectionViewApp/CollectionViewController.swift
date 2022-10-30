//
//  CollectionViewController.swift
//  CollectionViewApp
//
//  Created by Арсентий Халимовский on 24.10.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    // let dataSource: [String] = ["USA", "Brazil", "China", "United Kindom", "Japan", "Mexico", "India"]

    let arrayOfImages: [UIImage] = [UIImage(contentsOfFile: "1")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            countryCell.configure(with: arrayOfImages[indexPath.row])
            
            cell = countryCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected country \(arrayOfImages[indexPath.row])")
    }
}
