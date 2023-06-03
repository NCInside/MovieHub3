//
//  ContentView.swift
//  MacMovieHub3
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: NavigationItem = .movie
    
    enum NavigationItem {
        case movie
        case theater
        case profile
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                NavigationLink(value: NavigationItem.movie) {
                    Label("Movies", systemImage: "film")
                }
                NavigationLink(value: NavigationItem.theater) {
                    Label("Theaters", systemImage: "popcorn")
                }
                NavigationLink(value: NavigationItem.profile) {
                    Label("Profile", systemImage: "person.fill")
                }
            }
            .frame(minWidth: 200)
        } detail: {
            switch selection {
            case .movie:
                MovieList()
            case .theater:
                CinemaList()
            case .profile:
                ProfileView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
