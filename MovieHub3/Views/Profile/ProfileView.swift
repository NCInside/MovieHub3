//
//  ProfileView.swift
//  MovieHub2
//
//  Created by Vincent on 19/05/23.
//
import SwiftUI

struct ProfileMenu: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView // Added a property to hold the destination view
}

struct ProfileView: View {
    let movieReviewsCount = 20
    let moviesLikedCount = 35

    var body: some View {
        NavigationView {
            VStack {
                Image("inception")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                Text("John Doe")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)

                Text("Age: 30")
                    .font(.headline)
                    .foregroundColor(.gray)

                Text("Location: New York")
                    .font(.headline)
                    .foregroundColor(.gray)

                HStack {
                    VStack {
                        Text("\(movieReviewsCount)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Movie Reviews")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    
                    Rectangle() // Add a Rectangle as a shorter vertical line
                        .frame(width: 2, height: 50) // Adjust the height as per your preference
                        .foregroundColor(.gray)

                    VStack {
                        Text("\(moviesLikedCount)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Movies Liked")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                .background(Color.black)
                .cornerRadius(10)
                
                MenuListView() // Pass the menu items to the MenuListView

                Spacer()
            }
            .padding()
            .background(Color.black)
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
