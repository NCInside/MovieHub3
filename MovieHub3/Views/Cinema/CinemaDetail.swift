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
    @Binding var isConfirmed: Bool
    @Environment(\.presentationMode) var presentationMode
    private let columns = [GridItem(.adaptive(minimum: 400))]
    
    init(cinema: Theater, isConfirmed: Binding<Bool>){
          self.cinema = cinema
          _isConfirmed = isConfirmed
          self._viewModel = StateObject(wrappedValue: CinemaViewModel(id: cinema.id))
      }
    
    var body: some View {
        GeometryReader{ geo in
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
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.listmovies) {movie in
                                NavigationLink {
                                    BuyTicketView(movie: movie, theaterid: cinema.id, size: geo.size.width, isConfirmed: $isConfirmed)
                                } label: {
                                    CinemaMovieCard(movie: movie, theaterid: cinema.id, size: geo.size.width)
                                }
                                .tag(movie)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }

                }.background(.black)
                    .foregroundColor(.white)
            }
            .onAppear {
                if isConfirmed {
                    withAnimation(.none) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }}
            .onDisappear(){
                    self.isConfirmed = false
                
            }
            .accentColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
        }
        
    }
}

//struct CinemaDetail_Previews: PreviewProvider {
//    static let modelData = ModelData()
//
//    static var previews: some View {
//        CinemaDetail(cinema: modelData.theaters[1]).environmentObject(modelData)
//    }
//}
