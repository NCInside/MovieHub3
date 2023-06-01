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
    @EnvironmentObject var userController: UserController
    @EnvironmentObject var ticketviewmodel : TicketViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("inception")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                Text(userController.user.name) // Use the name from the user controller
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)

                Text("Age: \(userController.user.age)") // Use the age from the user controller
                    .font(.headline)
                    .foregroundColor(.gray)

                Text("Location: \(userController.user.location)") // Use the location from the user controller
                    .font(.headline)
                    .foregroundColor(.gray)

                HStack {
                    VStack {
                        Text("\(userController.reviews.count)")
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
                        Text("\(ticketviewmodel.tickets.count)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Movies Watched")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
                .background(Color.black)
                .cornerRadius(10)
                
                MenuListView() // Pass the user controller to the MenuListView
                
                Spacer()
            }
            .padding()
            .background(Color.black)
            .navigationTitle("Profile")
        }
        .onAppear {
            userController.fetchAllReviews()
            ticketviewmodel.fetchAllTickets()
            
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//            .environmentObject(UserController())
//    }
//}
