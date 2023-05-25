//
//  MovieCard.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieCard: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            movie.image
                .resizable()
                .frame(minHeight: 270.0)
            HStack(spacing: 3) {
                ForEach (0..<(Int(movie.score)+1), id: \.self) {_ in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                }
                ForEach (0..<Int(5-movie.score), id: \.self) {_ in
                    Image(systemName: "star")
                        .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                }
            }
            .padding(.top, 10)
            Text(movie.title)
                .font(.system(size: 18, weight: .heavy, design: .default))
                .foregroundColor(.white)
                .padding(.top, 5)
            Text("\(movie.genres[0]) | \(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.gray)
                .padding(.top, 1)
        }
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var movies = ModelData().movies
    
    static var previews: some View {
        MovieList()
            .environmentObject(ModelData())
    }
}
