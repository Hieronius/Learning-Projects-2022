//
//  Movies.swift
//  NewCollectionViewApp
//
//  Created by Арсентий Халимовский on 30.10.2022.
//


import UIKit

struct Movie {
    let title: String
    let image: UIImage
}

let movies: [Movie] = [
    Movie(title: "Agents of S.H.I.E.L.D", image: UIImage(contentsOfFile: "agentsOfShield")!)]
          
          
