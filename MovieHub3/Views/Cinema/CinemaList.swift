//
//  TheaterList.swift
//  MovieHub
//
//  Created by MacBook Pro on 18/05/23.
//

import SwiftUI

struct CinemaList: View {
    
    @StateObject private var viewModel = CinemaListViewModel()
    
    init() {
        // Search Bar
        let searchBarAppearance = UISearchBar.appearance()
        searchBarAppearance.barStyle = .black
        searchBarAppearance.tintColor = .red
        let textFieldAppearance = UISearchTextField.appearance()
        textFieldAppearance.backgroundColor = .white
    }
    
    
    var body: some View {
        
            NavigationStack {
                
                    ScrollView{
                        ForEach(viewModel.theaters) { theater in
                            NavigationLink {
                                CinemaDetail(cinema: theater)
                                
                            } label: {
                                CinemaRow(cinema: theater)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding()
                    }
                    .background(.black)
                    .navigationTitle("Theatre")
                
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Theatres")
            .accentColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0)).background(.black)
        }
    }

struct CinemaList_Previews: PreviewProvider {
    static var previews: some View {
        CinemaList()
            .environmentObject(ModelData())
    }

}
