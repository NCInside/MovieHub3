//
//  CinemaDetail.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//
import SwiftUI
import MapKit

struct CinemaDetail: View {
    var cinema: Theater
    @StateObject private var viewModel: CinemaViewModel
    
    init(cinema: Theater){
        self.cinema = cinema
        self._viewModel = StateObject(wrappedValue: CinemaViewModel(id: cinema.id))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                MapView(coordinate: cinema.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)

                VStack(alignment: .leading) {
                    Text(cinema.name).font(.title)
                    HStack {
                        Image(systemName: "map.fill")
                        Text(cinema.location)
                    }
                    HStack {
                        Image(systemName: "phone.fill")
                        Text(cinema.phone)
                    }
                    Divider()
                }.padding(.leading)

                Rectangle()
                    .fill(Color.white)
                    .frame(height: 4)
                
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.listmovies) {movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            CinemaMovieCard(movie: movie, theaterid: cinema.id)
                        }
                        .tag(movie)
                        .buttonStyle(PlainButtonStyle())
                    }
                }

            }.background(.black)
                .foregroundColor(.white)
        }
        .accentColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
    }
}

struct CinemaDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CinemaDetail(cinema: modelData.theaters[1]).environmentObject(modelData)
    }
}
