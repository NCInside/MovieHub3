//
//  Detail.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Detail: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Synopsis")
                .foregroundColor(.white)
                .font(.system(size: 21, weight: .heavy, design: .default))
            Text(movie.synopsis)
                .foregroundColor(.gray)
                .padding(.vertical, 3)
            Spacer()
            Text("Cast & Crew")
                .foregroundColor(.white)
                .font(.system(size: 21, weight: .heavy, design: .default))
                .padding(.bottom, 4)
            ForEach(movie.cast.sorted(by: <), id: \.key) { crew, role in
                Text("\(crew) | \(role)")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Detail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
