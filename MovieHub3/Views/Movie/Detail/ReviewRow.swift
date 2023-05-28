//
//  ReviewRow.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct ReviewRow: View {
    
    var review: Review
    @State var isViewed = false
    
    var body: some View {
        HStack {
//            Text(review.comment ?? "")
//                .foregroundColor(.white)
//            Text(String(format: "%.1f", review.score))
//                .foregroundColor(.white)
            VStack (alignment: .leading, spacing: 12) {
                HStack {
                    HStack (alignment: .bottom) {
                        Image(systemName: "person")
                            .foregroundColor(.white)
                            .font(.system(size: 32))
                        Text("User")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium, design: .default))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .bottom, spacing: 1) {
                        ForEach (0..<(Int(review.score)+1), id: \.self) {_ in
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        }
                        ForEach (0..<Int(5-review.score), id: \.self) {_ in
                            Image(systemName: "star")
                                .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Button {
                    isViewed.toggle()
                } label: {
                    Text(review.comment ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .lineLimit(isViewed ? 15 : 5)
                        .padding()
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ReviewRow_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
