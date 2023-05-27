//
//  Showtime.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Showtime: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Showtime_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
