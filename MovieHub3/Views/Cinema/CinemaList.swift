//
//  TheaterList.swift
//  MovieHub
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct CinemaList: View {
    var cinema: Theater
    @StateObject private var viewModel: CinemaViewModel
    
    init(cinema: Theater) {
        //View Model Init
        self.cinema = cinema
        self._viewModel = StateObject(wrappedValue: CinemaViewModel(id: cinema.id))
        
        // Search Bar
        let searchBarAppearance = UISearchBar.appearance()
        searchBarAppearance.barStyle = .black
        searchBarAppearance.tintColor = .red
        let textFieldAppearance = UISearchTextField.appearance()
        textFieldAppearance.backgroundColor = .white
    }
    
    
    var body: some View {
        
            NavigationStack {
                
                    List{
                        ForEach(viewModel.theaters) { theater in
                            NavigationLink {
                                CinemaDetail(cinema: theater)
                            } label: {
                                CinemaRow(cinema: theater)
                            }
                            .buttonStyle(.automatic)
                        }
                    }
                    .background(.black)
                    .navigationTitle("Theatre")
                
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Theatres")
            .accentColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0)).background(.black)
        }
    }

struct CinemaList_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CinemaList(cinema: modelData.theaters[1]).environmentObject(modelData)
    }

}
