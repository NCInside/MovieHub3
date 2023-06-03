//
//  Detail.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Detail: View {
    
    var movie: Movie
    var size: CGFloat
    private let isIOS = {
        #if os(iOS)
        return true
        #else
        return false
        #endif
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Synopsis")
                .foregroundColor(.white)
                .font(.system(size: size * (isIOS() ? 0.0467 : 0.0311), weight: .heavy, design: .default))
            Text(movie.synopsis)
                .font(.system(size: size * (isIOS() ? 0.038 : 0.0287)))
                .foregroundColor(.gray)
                .padding(.vertical, 3)
            Spacer()
            Text("Cast & Crew")
                .foregroundColor(.white)
                .font(.system(size: size * (isIOS() ? 0.0467 : 0.0311), weight: .heavy, design: .default))
                .padding(.bottom, 4)
            ForEach(movie.cast.sorted(by: <), id: \.key) { crew, role in
                Text("\(crew) | \(role)")
                    .font(.system(size: size * (isIOS() ? 0.038 : 0.0287)))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Detail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
            .previewLayout(.sizeThatFits)
            #if !os(iOS)
            .frame(width: 1000, height: 1000)
            #endif
    }
}
