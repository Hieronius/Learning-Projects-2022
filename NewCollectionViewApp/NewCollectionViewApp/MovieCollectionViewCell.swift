//
//  MovieCollectionViewCell.swift
//  NewCollectionViewApp
//
//  Created by Арсентий Халимовский on 30.10.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        movieTitle.text = movie.title
        print("cell has been created")
    }
}
