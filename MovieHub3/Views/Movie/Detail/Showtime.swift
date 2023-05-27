//
//  Showtime.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Showtime: View {
    
    var showtimes: [Theater: [MovieTime]]
    
    var body: some View {
        VStack(alignment: .trailing) {
            ForEach(Array(showtimes.keys), id: \.self) {key in
                ShowtimeRow(showtime: (theater: key, movietimes: showtimes[key]!))
            }
        }
    }
}

struct Showtime_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
