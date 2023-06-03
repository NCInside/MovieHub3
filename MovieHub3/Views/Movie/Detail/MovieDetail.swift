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
        GeometryReader { geo in
            ScrollView {
                VStack(spacing: 6) {
                    movie.image
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea(edges: .top)
                        .frame(width: .infinity, height: geo.size.width * 0.6, alignment: .top)
                        .clipped()
                        .blur(radius:3)
                        .offset(y: geo.size.width * -0.1)
                    movie.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.4)
                        .offset(y: geo.size.width * -0.45)
                        .padding(.bottom, geo.size.width * -0.45)
                    Text(movie.title)
                        .foregroundColor(.white)
                        .font(.system(size: geo.size.width * 0.0533, weight: .heavy, design: .default))
                    Text("\(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                        .foregroundColor(.gray)
                        .font(.system(size: geo.size.width * 0.043))
                    Text(movie.genres.joined(separator: ", "))
                        .foregroundColor(.gray)
                        .font(.system(size: geo.size.width * 0.043))
                    HStack {
                        Text("\(String(format: "%1.1f", movie.score)) / 5")
                            .foregroundColor(.white)
                            .font(.system(size: geo.size.width * 0.0457, weight: .heavy, design: .default))
                        HStack(spacing: 3) {
                            ForEach (0..<(Int(movie.score)+1), id: \.self) {_ in
                                Image(systemName: "star.fill")
                                    .font(.system(size: geo.size.width * 0.035))
                                    .foregroundColor(Color(red: 255/255.0, green: 192/255.0, blue: 69/255.0))
                            }
                            ForEach (0..<Int(5-movie.score), id: \.self) {_ in
                                Image(systemName: "star")
                                    .font(.system(size: geo.size.width * 0.035))
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
                        Detail(movie: movie, size: geo.size.width)
                            .padding(.horizontal, 10)
                    case .reviews:
                        Reviews(geo: geo)
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
}

struct MovieDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
