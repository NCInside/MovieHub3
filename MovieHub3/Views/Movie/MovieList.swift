//
//  MovieList.swift
//  MovieHub2
//
//  Created by MacBook Pro on 19/05/23.
//

import SwiftUI

struct MovieList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var searchText = ""
    @State private var selectedCategory: MovieCategory = .nowShowing
    
    var movies: [Movie] {
        modelData.movies.filter { movie in
            selectedCategory.rawValue == movie.category.rawValue && (movie.title.lowercased().contains(searchText.lowercased()) || searchText == "")
        }
    }
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    enum MovieCategory: String, CaseIterable, Identifiable {
        case nowShowing = "Now Showing"
        case comingSoon = "Coming Soon"
        
        var id: MovieCategory { self }
    }
    
    init() {
        let searchBarAppearance = UISearchBar.appearance()
        searchBarAppearance.barStyle = .black
        searchBarAppearance.tintColor = .red
        let textFieldAppearance = UISearchTextField.appearance()
        textFieldAppearance.backgroundColor = .white
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(MovieCategory.allCases) {category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 10)
                LazyVGrid(columns: columns) {
                    ForEach(movies) {movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            MovieCard(movie: movie)
                        }
                        .tag(movie)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Movies")
            .background(Color.black)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Movies")
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
            .environmentObject(ModelData())
    }
}
