//
//  MovieList.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieList: View {
    
    @StateObject private var viewModel = MovieViewModel()
    
    private let columns : [GridItem]
    
    init() {
        #if os(iOS)
        let searchBarAppearance = UISearchBar.appearance()
        searchBarAppearance.barStyle = .black
        searchBarAppearance.tintColor = .red
        let textFieldAppearance = UISearchTextField.appearance()
        textFieldAppearance.backgroundColor = .white
        
        columns = Array(repeating: .init(.flexible()), count: 2)
        
        #else
        columns = Array(repeating: .init(.flexible()), count: 4)
        
        #endif
    }
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                ScrollView {
                    Picker("Category", selection: $viewModel.selectedCategory) {
                        ForEach(MovieViewModel.MovieCategory.allCases) {category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 10)
                    .labelsHidden()
                    #if !os(iOS)
                    .padding(.vertical, 10)
                    #endif
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.movies) {movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                MovieCard(movie: movie, size: geo.size.width)
                            }
                            .tag(movie)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 10)
                    #if !os(iOS)
                    .searchable(text: $viewModel.searchText, placement: .toolbar)
                    #endif

                }
                .navigationTitle("Movies")
                .background(Color.black)
            }
            #if os(iOS)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Movies")
            #endif
        .accentColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
            .environmentObject(ModelData())
    }
}
