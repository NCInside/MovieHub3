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
                VStack{
                    //header
                    VStack{
                        //big image
                        movie.image
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(edges: .top)
                            .frame(width: .infinity, height: 500, alignment: .top)
                            .clipped()
                            .blur(radius:3)
                            .offset(y: -50)
                        
                        //section, text and small image
                        HStack{
                            movie.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(width: 300)
                    
                            //section and text
                            VStack{
                                Spacer()
                                //text
                                HStack{
                                    Spacer()
                                    VStack{
                                        Text(movie.title)
                                            .foregroundColor(.white)
                                            .font(.system(size: 70, weight: .heavy, design: .default))
                                        Text("\(movie.duration / 60)h \(movie.duration % 60)m | \(movie.rating)")
                                            .font(.system(size: 35, weight: .light, design: .default))
                                            .foregroundColor(.gray)
                                        Text(movie.genres.joined(separator: ", "))
                                            .font(.system(size: 40, weight: .light, design: .default))
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
                                    }
                                    .offset(y: -50)

                                    Spacer()
                                }
                                Spacer()
                                //section
                                if (movie.category != Movie.Category.comingSoon) {
                                    Picker("", selection: $viewModel.selectedSection) {
                                        ForEach(MovieDetailViewModel.MovieSection.allCases) {section in
                                            Text(section.rawValue).tag(section)
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    .padding(.horizontal, 10)
                                }
                            }
                        }
                        .offset(y: -350)
                        .padding(.leading, 60)
                    }
                    switch viewModel.selectedSection {
                    case .detail:
                        Detail(movie: movie, size: geo.size.width)
                            .padding(.horizontal, 10)
                            .offset(y: -300)
                    case .reviews:
                        Reviews(geo: geo)
                            .padding(.horizontal, 10)
                            .offset(y: -300)
                            .padding(.leading, 60)
                            .environmentObject(viewModel)
                    case .showtime:
                         Showtime(showtimes: viewModel.showtimes)
                             .padding(.horizontal, 10)
                             .offset(y: -300)
                             .padding(.leading, 60)
                             .padding(.trailing, 60)

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
            .previewLayout(.sizeThatFits)
            .frame(width: 1000, height: 1000)
    }
}
