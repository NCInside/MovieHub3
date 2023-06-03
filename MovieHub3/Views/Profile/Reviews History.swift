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
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("My Reviews")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    if userController.reviews.isEmpty {
                        Text("No reviews found.")
                            .foregroundColor(.gray)
                    } else {
                        List(userController.reviews, id: \.id) { review in
                            if review.user == "User" { // Replace "User" with the desired condition for user filtering
                                ReviewsRow(review: review)
                                    .environmentObject(userController)
                                    .padding(.vertical, 8)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .padding(.horizontal)
                .background(Color.black)
            }
            .navigationBarHidden(true)
        }
        .background(Color.black)
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            userController.fetchAllReviews()
        }
    }
}

struct ReviewsRow: View {
    var review: Review
    @EnvironmentObject private var userController: UserController
    @State private var isExpanded: Bool = false
    @StateObject var model = ModelData()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .bottom) {
                if let user = review.user {
                    Image("profilepic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 75)
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundColor(.white)
                        .font(.system(size: 32))
                        .frame(width: 75)
                }
                
                Text(userController.user.name)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium))
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            
            Text(model.movies[Int(review.movieID)].title)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
                .lineLimit(isExpanded ? nil : 5)
                .padding()
            
            HStack(alignment: .bottom, spacing: 1) {
                ForEach(0..<Int(review.score)) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                }
                ForEach(0..<Int(5 - review.score)) { _ in
                    Image(systemName: "star")
                        .foregroundColor(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.black)
            
            Button(action: {
                isExpanded.toggle()
            }) {
                Text(review.comment ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .lineLimit(isExpanded ? nil : 5)
                    .padding()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white, lineWidth: 1)
        )
        .background(Color.black)
    }
}

