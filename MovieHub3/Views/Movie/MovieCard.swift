//
//  MovieCard.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieCard: View {
    
    var movie: Movie
    var size: CGFloat
    private let isIOS = {
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            movie.image
                .resizable()
                .scaledToFill()
//                .frame(minHeight: 270.0, maxHeight: 270.0)
                .frame(width: size * (isIOS() ? 0.45 : 0.23))
                .clipped()
            HStack(spacing: 3) {
                ForEach (0..<(Int(movie.score)+1), id: \.self) {_ in
                    Image(systemName: "star.fill")
                        .font(.system(size: size * (isIOS() ? 0.035 : 0.0175)))
                        .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                }
                ForEach (0..<Int(5-movie.score), id: \.self) {_ in
                    Image(systemName: "star")
                        .font(.system(size: size * (isIOS() ? 0.035 : 0.0175)))
                        .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                }
            }
            .padding(.top, 10)
            Text(movie.title)
                .font(.system(size: size * (isIOS() ? 0.04 : 0.02), weight: .heavy, design: .default))
                .foregroundColor(.white)
                .padding(.top, 5)
            Text("\(movie.genres[0]) | \(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                .font(.system(size: size * (isIOS() ? 0.031 : 0.0155), weight: .medium, design: .default))
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
