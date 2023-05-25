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
}

struct ProfileView: View {
    let menus: [ProfileMenu] = [
        ProfileMenu(title: "Home"),
        ProfileMenu(title: "Profile"),
        ProfileMenu(title: "Settings"),
        ProfileMenu(title: "Messages"),
        ProfileMenu(title: "Logout")
    ]

    var body: some View {
        VStack {
            Image("profile_picture")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())

            Text("John Doe")
                .font(.title)
                .padding()

            Text("Age: 30")
                .font(.headline)

            Text("Location: New York")
                .font(.headline)

            Text("Menus")
                .font(.title)
                .padding(.top, 3)

            List(menus) { menu in
                Text(menu.title)
            }
            .padding(.horizontal, 5)

            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
