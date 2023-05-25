//
//  Movie.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var score: Double
    var genres: [String]
    var rating: String
    var synopsis: String
    var cast: [String: String]
    var duration: Int
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case nowShowing = "Now Showing"
        case comingSoon = "Coming Soon"
    }
}
