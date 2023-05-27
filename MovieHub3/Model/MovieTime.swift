//
//  MovieTime.swift
//  MovieHub3
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation

struct MovieTime: Hashable, Codable, Identifiable {
    var id: Int
    var theaterMovieID: Int
    var price: Int
    
    var date: String
    var dateDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: date)!
    }
    
    var hours: [String]
    var dateHours: [Date] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return hours.map {dateFormatter.date(from: $0)!}
    }
    
}
