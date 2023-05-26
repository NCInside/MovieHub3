//
//  MovieViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import Foundation

final class MovieViewModel: ObservableObject {
    
    @Published var searchText = ""
    var data: [Movie] = []
    @Published var movies: [Movie] = []
    @Published var selectedCategory: MovieCategory = .nowShowing {
        didSet {
            filterMovies()
        }
    }
    
    enum MovieCategory: String, CaseIterable, Identifiable {
        case nowShowing = "Now Showing"
        case comingSoon = "Coming Soon"
        
        var id: MovieCategory { self }
    }
    
    init() {
        data = ModelData.load("movieData.json")
        filterMovies()
    }
    
    private func filterMovies() {
        $searchText
            .map { searchText in
                return self.data.filter { movie in
                    self.selectedCategory.rawValue == movie.category.rawValue && (movie.title.lowercased().contains(searchText.lowercased()) || searchText == "")
                }
            }
            .assign(to: &$movies)
    }
    
}
