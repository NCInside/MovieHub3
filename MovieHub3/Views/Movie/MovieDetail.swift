//
//  MovieDetail.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var movie: Movie
    
    var body: some View {
        ScrollView {
            
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        MovieDetail(movie: modelData.movies[0]).environmentObject(modelData)
    }
}
