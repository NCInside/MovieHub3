//
//  TheaterMovie.swift
//  MovieHub3
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation

struct TheaterMovie: Hashable, Codable, Identifiable {
    var id: Int
    var movieID: Int
    var theaterID: Int
}
