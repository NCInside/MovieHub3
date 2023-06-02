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
            #if os(iOS)
                HStack {
                    HStack{
                        Image("cinema").frame(width: 50, height: 50)
                        Text(cinema.name)
                        Spacer()
                    }
                    HStack{
                        Image(systemName: "chevron.right").frame(width: 50, height: 50).foregroundColor(Color.red)
                    }
                }
                .background(Color.black)
                .foregroundColor(.white)
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 2)
            #endif
            #if os(macOS)
                HStack {
                    HStack{
                        Image("cinema")
                            .resizable()
                            .frame(width: 75, height: 75)
                        Text(cinema.name)
                            .font(.system(size: 50, weight: .heavy, design: .default))

                        Spacer()
                    }
                    HStack{
                        Image(systemName: "chevron.right").frame(width: 50, height: 50).foregroundColor(Color.red)
                    }
                }
                .frame(width: 1200, height: 75)

                .background(Color.black)
                .foregroundColor(.white)
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 2)
                    .frame(width: 1200, height: 75)

                Rectangle()
                    .fill(Color.black)
                    .frame(height: 2)
            
            #endif
            
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CinemaRow(cinema: modelData.theaters[1]).environmentObject(modelData)
    }
}
