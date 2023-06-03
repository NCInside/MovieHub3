//
//  ProfileView.swift
//  MovieHub2
//
//  Created by Vincent on 19/05/23.
//
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userController: UserController
    @EnvironmentObject var ticketviewmodel : TicketViewModel
    
    var body: some View {
        GeometryReader{ geo in
            NavigationStack {
                VStack {
                    Image("profilepic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())

                    Text(userController.user.name)
                        .font(.system(size: geo.size.width/45, weight: .medium, design: .default))
                        .padding()
                        .foregroundColor(.white)

                    Text("Age: \(userController.user.age)")
                        .font(.system(size: geo.size.width/60, weight: .medium, design: .default))
                        .foregroundColor(.gray)

                    Text("Location: \(userController.user.location)")
                        .font(.system(size: geo.size.width/60, weight: .medium, design: .default))
                        .foregroundColor(.gray)

                    HStack {
                        VStack {
                            Text("\(userController.reviews.filter { $0.user == "User" }.count)")
                                .font(.system(size: geo.size.width/45, weight: .light, design: .default))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Movie Reviews")
                                .font(.system(size: geo.size.width/90, weight: .light, design: .default))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        
                        Rectangle()
                            .frame(width: 2, height: 50)
                            .foregroundColor(.gray)

                        VStack {
                            Text("\(ticketviewmodel.tickets.count)")
                                .font(.system(size: geo.size.width/45, weight: .light, design: .default))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Movies Watched")
                                .font(.system(size: geo.size.width/90, weight: .light, design: .default))
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    
                    MenuListView(size: geo.size.width)
                    
                    Spacer()
                }
                .padding()
                .background(Color.black)
                .navigationTitle("Profile")
            }.accentColor(.red)
            .onAppear {
                userController.fetchAllReviews()
                ticketviewmodel.fetchAllTickets()
                
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//            .environmentObject(UserController())
//    }
//}
