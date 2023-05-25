//
//  CinemaDetail.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//
import SwiftUI
import MapKit

struct CinemaDetail: View {
    var body: some View {
        ScrollView{
            MapView(coordinate: CLLocationCoordinate2D(latitude: -7.285449, longitude: 112.631376))
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            VStack(alignment: .leading) {
                Text("Pakuwon Mall Theatre").font(.title)
                HStack {
                    Image(systemName: "map.fill")
                    Text("adsfadf")
                }
                HStack {
                    Image(systemName: "phone.fill")
                    Text("adsfadf")
                }
                Divider()
            }.padding(.leading)

            Rectangle()
                .fill(Color.white)
                .frame(height: 4)


        }.background(.black)
            .foregroundColor(.white)
    }
}

struct CinemaDetail_Previews: PreviewProvider {
    static var previews: some View {
        CinemaDetail()
    }
}
