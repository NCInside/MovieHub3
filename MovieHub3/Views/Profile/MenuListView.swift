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
    let destination: () -> AnyView
    
    init<Destination: View>(title: String, destination: @escaping () -> Destination) {
        self.title = title
        self.destination = { AnyView(destination()) }
    }
}

struct MenuListView: View {
    @EnvironmentObject var userController: UserController
    
    var menus: [Menu] {
        [
            Menu(title: "Account Information", destination: { AccountInformation().environmentObject(userController) }),
            Menu(title: "Transactions History", destination: { Transaction_History().environmentObject(userController) }),
            Menu(title: "Reviews History", destination: { Reviews_History().environmentObject(userController) }),
//            Menu(title: "Liked Movies", destination: { Watchlist().environmentObject(userController) }),
            Menu(title: "Logout", destination: { AccountInformation().environmentObject(userController) })
        ]
    }
    
    var body: some View {
        VStack {
            ForEach(menus) { menu in
                NavigationLink(destination: menu.destination()) {
                    Text(menu.title)
                        .padding(.vertical, 7)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                }
            }
            Spacer()
        }
        .padding(.bottom, 20)
    }
}
