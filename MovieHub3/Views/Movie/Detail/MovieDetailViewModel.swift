//
//  MovieDetailViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import Foundation
import CoreData

final class MovieDetailViewModel: ObservableObject {
    
    @Published var selectedSection: MovieSection = .detail
    enum MovieSection: String, CaseIterable, Identifiable {
        case detail = "Detail"
        case reviews = "Reviews"
        case showtime = "Showtime"
        
        var id: MovieSection { self }
    }
    
    @Published var showtimes: [Theater: [MovieTime]] = [:]
    private var theaterMovies: [TheaterMovie]
    private var theaters: [Theater]
    private var movieTimes: [MovieTime]
    
    let container: NSPersistentContainer
    @Published var savedReviews: [Review] = []
    
    @Published var comment = ""
    @Published var score: Double = 2.5
    
    @Published var id: Int
    
    init(id: Int) {
        self.id = id
        
        container = NSPersistentContainer(name: "MovieHub3")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        
        theaterMovies = ModelData.load("theaterMovieData.json")
        theaters = ModelData.load("theaterData.json")
        movieTimes = ModelData.load("timeData.json")
        
        fetchReviews()
        
        let theaters = getTheaters(movieID: id)
        theaters.forEach {theater in
            self.showtimes[theater] = getTimes(theaterMovieID: theater.id)
        }
    }
    
    func fetchReviews() {
        let request = NSFetchRequest<Review>(entityName: "Review")
        let predicate = NSPredicate(format: "movieID == %d", Int16(id))
        request.predicate = predicate
        
        do {
            savedReviews = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addReview() {
        let newReview = Review(context: container.viewContext)
        newReview.comment = comment
        newReview.score = score
        newReview.movieID = Int16(id)
        newReview.timestamp = Date()
        saveData()
    }
    
    func saveData(){
        do {
            try container.viewContext.save()
            fetchReviews()
        } catch let error {
            print("Error saving. \(error)")
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
