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
            VStack {
                Text("My Reviews")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 150)
                
                if userController.reviews.isEmpty {
                    Spacer()
                    Text("No reviews found.")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(userController.reviews, id: \.id) { review in
                                if review.user == "You" {
                                    ReviewsRow(review: review)
                                        .environmentObject(userController)
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
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
            VStack(alignment: .leading) {
                HStack {
                    Image("You")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)

                    Text(userController.user.name)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(model.movies[Int(review.movieID)].title)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .lineLimit(isExpanded ? nil : 1)
                
                HStack {
                    ForEach(0..<Int(review.score)) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.red)
                    }
                    ForEach(0..<Int(5 - review.score)) { _ in
                        Image(systemName: "star")
                            .foregroundColor(Color.red)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    isExpanded.toggle()
                }) {
                    Text(review.comment ?? "")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(isExpanded ? nil : 3)
                        .padding(.top)
                }
            }
            .padding()
            .frame(minWidth: 300, maxWidth: .infinity)
        }
        .background(Color.black)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white)
        )
        .padding(.vertical)
    }
}


struct Reviews_History_Previews: PreviewProvider {
    static var previews: some View {
        let userController = UserController()
        
        return Reviews_History()
            .environmentObject(userController)
    }
}

