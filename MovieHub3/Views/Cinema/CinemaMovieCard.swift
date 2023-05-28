//
//  CinemaMovieCard.swift
//  MovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct CinemaMovieCard: View {
    var movie: Movie
    var showtime: (theater: Theater, movietimes: [MovieTime])!

    @StateObject private var viewModel: CinemaMovieViewModel
    var theaterid: Int

    init(movie: Movie, theaterid: Int){
        self.movie = movie
        self._viewModel = StateObject(wrappedValue: CinemaMovieViewModel(idmovietheater: movie.id, theaterid: theaterid))
        self.theaterid = theaterid
        self.showtime = (theater: viewModel.theater, movietimes: viewModel.showtimes)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            movie.image
                .resizable()
                .frame(width: 170, height: 270)
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

            Text(movie.title)
                .font(.system(size: 18, weight: .heavy, design: .default))
                .foregroundColor(.white)
                .padding(.top, 5)
            Text("\(movie.genres[0]) | \(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.gray)
                .padding(.top, 1)
            

            HStack{
                VStack(alignment: .leading) {
                    ForEach(showtime.movietimes, id: \.self) {time in
                        HStack {
                            Capsule()
                                .fill(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                                .frame(width: 60, height: 30)
                                .overlay(
                                    Text(time.date.prefix(5))
                                )
                            ForEach(time.hours, id: \.self) {hour in
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0), lineWidth: 2)
                                    .frame(width: 60, height: 30)
                                    .overlay(
                                        Text(hour)
                                            .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                                    )
                            }
                        }
                    }
                }
            }
            
        }.background(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 15)
    }
}

struct CinemaMovieCard_Previews: PreviewProvider {
    static var movies = ModelData().movies

    static var previews: some View {
        CinemaMovieCard(movie: movies[0], theaterid: 2)

    }
}
