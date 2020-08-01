//
//  SingleMovieViewController.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/31/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import UIKit

class SingleMovieViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    
    var singleMovieModel = MovieListViewController.singleMovieModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        singleMovieModel.delegate = self
    }
}

extension SingleMovieViewController: SingleMovieDelegate {
    
    func updateSingleMovieData(withData data: SingleMovieData) {
        DispatchQueue.main.async {
            
            var genres: String = ""
            for genre in data.genres {
                genres += genre.genre_name + ", "
            }
            genres = String(genres.dropLast(2))
            
            var stars: String = ""
            for star in data.stars {
                stars += star.star_name + ", "
            }
            stars = String(stars.dropLast(2))
            
            self.titleLabel.text = data.movie_title
            self.ratingLabel.text = String(data.movie_rating)
            self.yearLabel.text = data.movie_year
            self.directorLabel.text = data.movie_director
            
            self.genreLabel.text = genres
            
            self.starsLabel.text = stars
        }
    }
}
