//
//  ListMovieData.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/27/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation

struct ListMovieData: Codable {
    let movie_id: String
    let movie_title: String
    let movie_year: String
    let movie_director: String
    
    let stars_name: [StarData]
    let genres_name: [GenreData]
    
    let rating: Double
}

struct StarData: Codable {
    let star_name: String
    let star_id: String
}

struct GenreData: Codable {
    let genre_name: String
    let genre_id: String
}
