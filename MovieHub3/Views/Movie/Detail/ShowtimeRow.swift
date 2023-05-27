//
//  ShowtimeRow.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct ShowtimeRow: View {
    
    var showtime: (theater: Theater, movietimes: [MovieTime])
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "popcorn.circle.fill")
                        .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        .font(.system(size: 32))
                    Text(showtime.theater.location)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .regular, design: .default))
                }
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
            
            Spacer()
        }
        .padding(.vertical, 10)
    }
}

struct ShowtimeRow_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
