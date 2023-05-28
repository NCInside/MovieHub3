//
//  CinemaMovieViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import Foundation

final class CinemaMovieViewModel: ObservableObject {
    @Published var showtimes: [MovieTime] = []
    @Published var theater: Theater!

    private var theaterMovies: [TheaterMovie]
    private var theaters: [Theater]
    private var movieTimes: [MovieTime]
    
    init(idmovietheater: Int, theaterid: Int) {
        theaterMovies = ModelData.load("theaterMovieData.json")
        theaters = ModelData.load("theaterData.json")
        movieTimes = ModelData.load("timeData.json")

        self.showtimes = getTimes(theaterMovieID: idmovietheater)
        self.theater = getTheater(theaterid: theaterid)
    }
    
    private func getTimes(theaterMovieID: Int) -> [MovieTime] {
        return movieTimes.filter { $0.theaterMovieID == theaterMovieID }
    }
    
    private func getTheater(theaterid: Int) -> Theater {
        return theaters.first(where: { $0.id == theaterid })!
    }
    
}
