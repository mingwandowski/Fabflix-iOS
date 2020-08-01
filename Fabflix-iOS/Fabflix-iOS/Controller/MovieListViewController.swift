//
//  MovieListViewController.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/30/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listMovieData: [ListMovieData] = []
    
    var searchModel = SearchViewController.searchModel
    
    static let singleMovieModel = SingleMovieModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
}

extension MovieListViewController: SearchDelegate {
    func updateListMovieData(withData data: [ListMovieData]) {
        DispatchQueue.main.async {
            self.listMovieData = data
            print(self.listMovieData)
            self.tableView.reloadData()
        }
    }
}

extension MovieListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listMovieData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieData = self.listMovieData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MovieCell
        cell.title.text = movieData.movie_title
        cell.score.text = String(movieData.rating)
        
        var content: String = "year: \(movieData.movie_year)\n"
        content += "director: \(movieData.movie_director)"
        // construct genres
        content += "genre: "
        for genreData in movieData.genres_name {
            content += genreData.genre_name + ", "
        }
        content = String(content.dropLast(2)) + "\n"
        // construct stars
        content += "stars: "
        for starData in movieData.stars_name {
            content += starData.star_name + ", "
        }
        content = String(content.dropLast(2))
        
        cell.content.text = content
        
        return cell
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let movieId = self.listMovieData[indexPath.row].movie_id
        MovieListViewController.singleMovieModel.searchSingleMovie(withMovieId: movieId)
        
        performSegue(withIdentifier: "toSingleMoviePage", sender: self)
    }
}
