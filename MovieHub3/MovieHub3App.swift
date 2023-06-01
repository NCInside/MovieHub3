//
//  MovieHub3App.swift
//  MovieHub3
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

@main
struct MovieHub2App: App {
    @StateObject private var modelData = ModelData()
    @StateObject private var userController = UserController()
    @StateObject private var ticketViewModel = TicketViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(userController)
                .environmentObject(ticketViewModel)
            
        }
    }
}
