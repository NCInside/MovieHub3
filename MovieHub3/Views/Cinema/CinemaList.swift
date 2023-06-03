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
            GeometryReader{ geo in
                NavigationStack {
                        #if os(macOS)
                            Text("Theaters")
                        .padding(.top, geo.size.height/20)
                                .font(.system(size: geo.size.width/30, weight: .heavy, design: .default))
                        #endif
                        ScrollView{
                            ForEach(viewModel.theaters) { theater in
                                NavigationLink {
                                    #if os(macOS)
                                    CinemaDetail(cinema: theater,size: geo.size.width)
                                    #endif
                                    #if os(iOS)
                                    CinemaDetail(cinema: theater)
                                    #endif
                                } label: {
                                    CinemaRow(cinema: theater, size: geo.size.width*13/15)
                                        .padding(.trailing, geo.size.width/15)
                                        .padding(.leading, geo.size.width/15)
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
    }

struct CinemaList_Previews: PreviewProvider {
    static var previews: some View {
        CinemaList()
            .environmentObject(ModelData())
    }

}
