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
        #if os(iOS)
        let searchBarAppearance = UISearchBar.appearance()
        searchBarAppearance.barStyle = .black
        searchBarAppearance.tintColor = .red
        let textFieldAppearance = UISearchTextField.appearance()
        textFieldAppearance.backgroundColor = .white
        #endif
    }
    
    
    var body: some View {
        
            NavigationStack {
                    #if os(macOS)
                        Text("Theaters")
                            .padding(.top, 30)
                            .font(.system(size: 50, weight: .heavy, design: .default))
                    #endif
                    ScrollView{
                        ForEach(viewModel.theaters) { theater in
                            NavigationLink {
                                CinemaDetail(cinema: theater)
                            } label: {
                                CinemaRow(cinema: theater)
                            }
                            .tag(theater)
                            .buttonStyle(.plain)
                        }
                        .padding()
                    }
                    .background(.black)
                    .navigationTitle("Theatre")
                
            }
            #if os(iOS)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Theatres")
            #endif
            .accentColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0)).background(.black)
        }
    }

struct CinemaList_Previews: PreviewProvider {
    static var previews: some View {
        CinemaList()
            .environmentObject(ModelData())
    }

}
