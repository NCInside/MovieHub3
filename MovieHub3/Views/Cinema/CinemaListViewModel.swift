//
//  CinemaListViewModel.swift
//  MovieHub3
//
//  Created by MacBook Pro on 30/05/23.
//

import Foundation

final class CinemaListViewModel: ObservableObject {
    @Published var theaters: [Theater] = [] // Assign initial value

    @Published var searchText = ""
    var data: [Theater] = []

    init() {
        data = ModelData.load("theaterData.json")
        filterTheatres()
    }

    private func filterTheatres() {
        $searchText
            .map { searchText in
                return self.data.filter { theater in
                    (theater.name.lowercased().contains(searchText.lowercased()) || searchText == "")
                }
            }
            .assign(to: &$theaters)
    }
}
