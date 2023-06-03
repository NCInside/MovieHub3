//
//  Showtime.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Showtime: View {
    
    var showtimes: [Theater: [MovieTime]]
    private let columns = [GridItem(.adaptive(minimum: 400))]
    
    var body: some View {
        VStack(alignment: .trailing) {
            LazyVGrid(columns: columns) {
                ForEach(Array(showtimes.keys), id: \.self) {key in
                    ShowtimeRow(showtime: (theater: key, movietimes: showtimes[key]!))
                        .padding(.top, 10)
                }
            }
        }
    }
}

struct Showtime_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0])
            .environmentObject(modelData)
            #if !os(iOS)
            .frame(width: 1000, height: 1000)
            #endif
    }
}
