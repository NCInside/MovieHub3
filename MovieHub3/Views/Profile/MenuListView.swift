//
//  ProfileMenu.swift
//  MovieHub2
//
//  Created by Vincent on 19/05/23.
//
import SwiftUI

struct Menu: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}

struct MenuListView: View {
    let menus: [Menu] = [
        Menu(title: "Account Information", destination: AnyView(AccountInformation())),
        Menu(title: "Transactions History", destination: AnyView(Transaction_History())),
        Menu(title: "Reviews History", destination: AnyView(Reviews_History())),
        Menu(title: "Liked Movies", destination: AnyView(Watchlist())),
        Menu(title: "Logout", destination: AnyView(AccountInformation()))
]
    var body: some View {
        VStack {

            ForEach(menus) { menu in
                NavigationLink(destination: menu.destination) {
                    GeometryReader { geometry in
                        VStack {
                            
                            Text(menu.title)
                                .padding(.vertical, 7)
                                .foregroundColor(.white)
                            
                        }
                        .frame(width: geometry.size.width - 30) // Adjust frame width to fill available space
                        .background(Color.red) // Add background color to create a box
                        .cornerRadius(10) // Add corner radius for rounded edges
                        .padding(.vertical, 5) // Apply vertical padding
                        .padding(.horizontal, 15) // Apply horizontal padding
                    }
                }
            }
            Spacer() // Add spacer to push the content upwards
        }
        .padding(.bottom, 20) // Add bottom padding to create space between content and bottom edge
    }
}





struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
