//
//  MovieRow.swift
//  MovieHub
//
//  Created by MacBook Pro on 17/05/23.
//

import SwiftUI

struct CinemaRow: View {
    var cinema: Theater
    @StateObject private var viewModel: CinemaViewModel
    
    init(cinema: Theater){
        self.cinema = cinema
        self._viewModel = StateObject(wrappedValue: CinemaViewModel(id: cinema.id))
    }

    
    var body: some View {
        VStack{
            HStack {
                HStack{
                    Image("cinema").frame(width: 50, height: 50)
                    Text(cinema.name)
                }
                HStack{
                    Spacer()
                }
            }
            .foregroundColor(.black)
            Rectangle()
                .fill(Color.white)
                .frame(height: 2)
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CinemaRow(cinema: modelData.theaters[1]).environmentObject(modelData)
    }
}
