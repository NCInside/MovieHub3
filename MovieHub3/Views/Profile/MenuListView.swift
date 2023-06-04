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
    var size: CGFloat
    init(size: CGFloat) {
        self.size = size
    }
    
    @EnvironmentObject var userController: UserController
    
    var menus: [Menu] {
        [
            Menu(title: "Account Information", destination: { AccountInformation().environmentObject(userController) }),
            Menu(title: "Transactions History", destination: { Transaction_History().environmentObject(userController) }),
            Menu(title: "Reviews History", destination: { Reviews_History().environmentObject(userController) }),
            Menu(title: "Logout", destination: { AccountInformation().environmentObject(userController) })
        ]
    }
    
    var body: some View {
        VStack {
            ForEach(menus) { menu in
                NavigationLink (destination: menu.destination()){
                    Text(menu.title)
//                        .font(.subheadline)
                        .frame(height: 20)
                        .frame(maxWidth: .infinity)
                }
//                #if !os(iOS)
                .padding(.vertical, 8)
//                #endif
                .background(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                .cornerRadius(10)
                .buttonStyle(.plain)
                .foregroundColor(Color.white)
            }
            Spacer()
        }
        .padding(.bottom, 20)
    }
}
