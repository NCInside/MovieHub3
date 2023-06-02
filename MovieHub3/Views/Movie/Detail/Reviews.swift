//
//  Reviews.swift
//  MovieHub3
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct Reviews: View {
    
    @EnvironmentObject private var viewModel: MovieDetailViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(viewModel.savedReviews) {review in
                ReviewRow(review: review)
            }
            
            NavigationLink {
                ReviewCreate()
                    .environmentObject(viewModel)
            } label: {
                Text("Write a review")
                    .font(.headline)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    
            }
            .background(.blue)
            .cornerRadius(10)
            
            
        }
    }
}

struct Reviews_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
