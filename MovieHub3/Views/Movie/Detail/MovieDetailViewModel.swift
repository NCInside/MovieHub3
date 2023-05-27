//
//  MovieDetailViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    
    @Published var selectedSection: MovieSection = .detail
    
    enum MovieSection: String, CaseIterable, Identifiable {
        case detail = "Detail"
        case reviews = "Reviews"
        case showtime = "Showtime"
        
        var id: MovieSection { self }
    }
    
}
