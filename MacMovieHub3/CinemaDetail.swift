//
//  CinemaDetail.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//
import SwiftUI
import MapKit

struct CinemaDetail: View {
    var size: CGFloat
    var cinema: Theater
    @StateObject private var viewModel: CinemaViewModel
    @Binding var isConfirmed: Bool
    @Environment(\.presentationMode) var presentationMode
    
    init(cinema: Theater, size:CGFloat, isConfirmed: Binding<Bool>){
        _isConfirmed = isConfirmed
        self.cinema = cinema
        self._viewModel = StateObject(wrappedValue: CinemaViewModel(id: cinema.id))
        self.size = size
    }
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                MapView(coordinate: cinema.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(width: size/3,height: size/3)
                
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text(cinema.name)
                            .font(.system(size: size/23, weight: .heavy, design: .default))
                    }
                    
                    
                    HStack {
                        Image(systemName: "map.fill")
                            .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        Text(cinema.location)
                            .font(.system(size: size/28, weight: .light, design: .default))

                    }
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        Text(cinema.phone)
                            .font(.system(size: size/28, weight: .light, design: .default))
                    }
                }
            }
            .padding(.leading, size/20)

            ScrollView{
                VStack{
                    ForEach(viewModel.listmovies) {movie in
                        NavigationLink {
                            BuyTicketView(movie: movie, theaterid: cinema.id, size: size,isConfirmed: $isConfirmed)
                        } label: {
                            CinemaMovieCard(movie: movie, theaterid: cinema.id, size: size)
                        }
                        .tag(movie)
                        .buttonStyle(PlainButtonStyle())
                    }
                }.padding(.top, size/20)
            }

            Spacer()
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
    }
}

//struct CinemaDetail_Previews: PreviewProvider {
//    static let modelData = ModelData()
//
//    static var previews: some View {
//        CinemaDetail(cinema: modelData.theaters[1], size: 100.0).environmentObject(modelData)
//    }
//}
