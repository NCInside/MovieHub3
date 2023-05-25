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
}

struct MenuListView: View {
    let menus: [Menu] = [
        Menu(title: "Home"),
        Menu(title: "Profile"),
        Menu(title: "Settings"),
        Menu(title: "Messages"),
        Menu(title: "Logout")
    ]

    var body: some View {
        VStack {
            Text("Menus")
                .font(.title)
                .padding(.top, 3)

            List(menus) { menu in
                Text(menu.title)
            }
            .padding(.horizontal, 5)
        }
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}
