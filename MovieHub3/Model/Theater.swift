//
//  Theater.swift
//  MovieHub3
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation
import CoreLocation

struct Theater: Hashable, Codable, Identifiable {
    var id: Int
    var location: String
    
    private var coordinate: Coordinate
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude)
    }

    struct Coordinate: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
