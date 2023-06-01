//
//  Reviews History.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//

import SwiftUI
struct Reviews_History: View {
    @EnvironmentObject private var userController: UserController
    
    var body: some View {
        NavigationView {
            VStack {
                List(userController.reviews, id: \.id) { review in
                    ReviewRow(review: review)
                        .foregroundColor(.red)
                        .background(Color.black)
                }
                .listRowBackground(Color.black)
                .background(Color.black)
                .navigationBarTitle("My Reviews")
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
//            .navigationBarBackButtonStyle(.foregroundColor(.red))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            userController.fetchAllReviews()
        }
    }
}


