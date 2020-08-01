//
//  SingleMovieData.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/31/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation

struct SingleMovieData: Codable {
    let movie_title: String
    let movie_year: String
    let movie_rating: Double
    let movie_director: String
    
    let genres: [GenreData]
    let stars: [StarData]
}
