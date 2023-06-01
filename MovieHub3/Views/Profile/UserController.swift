//
//  UserController.swift
//  MovieHub2
//
//  Created by Vincent on 22/05/23.
//

import Foundation

class UserController: ObservableObject {
    @Published var user: User
    
    init() {
        // Retrieve the saved user data or set default values
        if let data = UserDefaults.standard.data(forKey: "user"),
           let savedUser = try? JSONDecoder().decode(User.self, from: data) {
            self.user = savedUser
        } else {
            self.user = User(id: "1", email: "", password: "", phone: "", profilePic: "", name: "", age: 0, location: "")
        }
    }
    
    func saveUser() {
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: "user")
        }
    }
    
    func loadUserFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: "user"),
           let savedUser = try? JSONDecoder().decode(User.self, from: data) {
            self.user = savedUser
        }
    }
}
