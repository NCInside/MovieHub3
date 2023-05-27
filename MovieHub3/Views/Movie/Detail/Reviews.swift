//
//  Reviews.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Reviews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Reviews_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
