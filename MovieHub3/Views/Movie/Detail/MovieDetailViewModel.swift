//
//  MovieDetailViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    @Published var selectedSection: MovieSection = .detail
    @Published var showtimes: [Theater: [MovieTime]] = [:]
    
    private var theaterMovies: [TheaterMovie]
    private var theaters: [Theater]
    private var movieTimes: [MovieTime]
    
    enum MovieSection: String, CaseIterable, Identifiable {
        case detail = "Detail"
        case reviews = "Reviews"
        case showtime = "Showtime"
        
        var id: MovieSection { self }
    }
    
    init(id: Int) {
        theaterMovies = ModelData.load("theaterMovieData.json")
        theaters = ModelData.load("theaterData.json")
        movieTimes = ModelData.load("timeData.json")
        
        let theaters = getTheaters(movieID: id)
        theaters.forEach {theater in
            self.showtimes[theater] = getTimes(theaterMovieID: theater.id)
        }
    }
    
    private func getTheaters(movieID: Int) -> [Theater] {
        let theaterIDs = theaterMovies.filter { $0.movieID == movieID }.map { $0.theaterID }
        return theaters.filter { theaterIDs.contains($0.id) }
    }
    
    private func getTimes(theaterMovieID: Int) -> [MovieTime] {
        return movieTimes.filter { $0.theaterMovieID == theaterMovieID }
    }
    
}
