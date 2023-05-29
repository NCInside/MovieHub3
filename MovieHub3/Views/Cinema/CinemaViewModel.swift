//
//  CinemaViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation

final class CinemaViewModel: ObservableObject {
    @Published var listmovies: [Movie] = []
    @Published var theaters: [Theater]
    @Published var searchText = ""

    private var theaterMovies: [TheaterMovie]
    private var movies: [Movie]
    
    init(id: Int) {
        theaterMovies = ModelData.load("theaterMovieData.json")
        theaters = ModelData.load("theaterData.json")
        movies = ModelData.load("movieData.json")

        let movies = getMovies(theaterID: id)
        movies.forEach {movie in
            self.listmovies = getMovies(theaterID: id)
        }
        
        filterTheatres()
    }
    private func getMovies(theaterID: Int) -> [Movie] {
        let movieIDs = theaterMovies.filter { $0.theaterID == theaterID }.map { $0.movieID }
        return movies.filter { movieIDs.contains($0.id) }
    }
    
    private func filterTheatres() {
        $searchText
            .map { searchText in
                return self.theaters.filter { theater in
                    theater.name.lowercased().contains(searchText.lowercased()) || searchText == ""
                }
            }
            .assign(to: &$theaters)
    }
}
