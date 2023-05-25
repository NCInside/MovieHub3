//
//  MovieHub3App.swift
//  MovieHub3
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

@main
struct MovieHub3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
