//
//  CinemaViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation

final class CinemaViewModel: ObservableObject {
    @Published var listmovies: [Movie] = []
    
    private var theaterMovies: [TheaterMovie]
    private var movies: [Movie]
    private var theaters: [Theater]
    
    init(id: Int) {
        theaterMovies = ModelData.load("theaterMovieData.json")
        theaters = ModelData.load("theaterData.json")
        movies = ModelData.load("movieData.json")

        let movies = getMovies(theaterID: id)
        movies.forEach {movie in
            self.listmovies = getMovies(theaterID: id)
        }
    }
    private func getMovies(theaterID: Int) -> [Movie] {
        let movieIDs = theaterMovies.filter { $0.theaterID == theaterID }.map { $0.movieID }
        return movies.filter { movieIDs.contains($0.id) }
    }
}
