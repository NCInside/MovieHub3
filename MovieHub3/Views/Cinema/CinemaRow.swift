//
//  MovieRow.swift
//  MovieHub
//
//  Created by MacBook Pro on 17/05/23.
//

import SwiftUI

struct CinemaRow: View {
    var size: CGFloat
    
    var cinema: Theater
    @StateObject private var viewModel: CinemaViewModel
    
    init(cinema: Theater, size: CGFloat){
        self.cinema = cinema
        self._viewModel = StateObject(wrappedValue: CinemaViewModel(id: cinema.id))
        self.size = size
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
                            .frame(width: size/15, height: size/15)
                        Text(cinema.name)
                            .font(.system(size: size/23, weight: .light, design: .default))

                        Spacer()
                    }
                    HStack{
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: size/20, height: size/20)
                            .foregroundColor(Color.red)
                    }
                }
                .frame(width: size, height: size/14)
                .background(Color.black)
                .foregroundColor(.white)
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 2)
                    .frame(width: size, height: size/14)

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
        CinemaRow(cinema: modelData.theaters[1], size: 40.0).environmentObject(modelData)
    }
}
