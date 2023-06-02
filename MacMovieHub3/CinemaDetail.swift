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
        HStack{
            Spacer()
            VStack{
                MapView(coordinate: cinema.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(width: 500,height: 500)
                
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text(cinema.name)
                            .font(.system(size: 45, weight: .heavy, design: .default))
                    }
                    
                    
                    HStack {
                        Image(systemName: "map.fill")
                            .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        Text(cinema.location)
                            .font(.system(size: 25, weight: .light, design: .default))

                    }
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        Text(cinema.phone)
                            .font(.system(size: 25, weight: .light, design: .default))
                    }
                }
                .offset(x: -50)

            }
            .offset(x: 100)

            ScrollView{
                VStack{
                    ForEach(viewModel.listmovies) {movie in
                        NavigationLink {
                            BuyTicketView(movie: movie, theaterid: cinema.id)
                        } label: {
                            CinemaMovieCard(movie: movie, theaterid: cinema.id)
                        }
                        .tag(movie)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .offset(y: 60)

            Spacer()
        }
        
    }
}

struct CinemaDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CinemaDetail(cinema: modelData.theaters[1]).environmentObject(modelData)
    }
}
