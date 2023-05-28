//
//  MovieDetail.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie: Movie
    @StateObject private var viewModel: MovieDetailViewModel
    
    init(movie: Movie) {
        self.movie = movie
        self._viewModel = StateObject(wrappedValue: MovieDetailViewModel(id: movie.id))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 6) {
                movie.image
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .top)
                    .frame(width: .infinity, height: 240, alignment: .top)
                    .clipped()
                    .blur(radius:3)
                    .offset(y: -50)
                movie.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(y: -180)
                    .padding(.bottom, -180)
                Text(movie.title)
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .heavy, design: .default))
                Text("\(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                    .foregroundColor(.gray)
                Text(movie.genres.joined(separator: ", "))
                    .foregroundColor(.gray)
                HStack {
                    Text("\(String(format: "%1.1f", movie.score)) / 5")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .heavy, design: .default))
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
                }
                .padding(.vertical, 8)
                if (movie.category != Movie.Category.comingSoon) {
                    Picker("Section", selection: $viewModel.selectedSection) {
                        ForEach(MovieDetailViewModel.MovieSection.allCases) {section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)
                    .padding(.bottom, 16)
                }
                switch viewModel.selectedSection {
                case .detail:
                    Detail(movie: movie)
                        .padding(.horizontal, 10)
                case .reviews:
                    Reviews()
                        .padding(.horizontal, 10)
                        .environmentObject(viewModel)
                case .showtime:
                    Showtime(showtimes: viewModel.showtimes)
                        .padding(.horizontal, 10)
                }
            }
        }
        .background(.black)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
