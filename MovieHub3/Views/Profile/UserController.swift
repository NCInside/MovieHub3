//
//  UserController.swift
//  MovieHub2
//
//  Created by Vincent on 22/05/23.
//

import Foundation
import CoreData

class UserController: ObservableObject {
    @Published var user: User
    @Published var reviews: [Review] = [] // Array to store all reviews
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        // Retrieve the saved user data or set default values
        if let data = UserDefaults.standard.data(forKey: "user"),
           let savedUser = try? JSONDecoder().decode(User.self, from: data) {
            self.user = savedUser
        } else {
            self.user = User(id: "1", email: "", password: "", phone: "", profilePic: "", name: "", age: 0, location: "")
        }
        
        persistentContainer = NSPersistentContainer(name: "MovieHub3")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data: \(error)")
            }
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
    
    
    func fetchAllReviews() {
        let request = NSFetchRequest<Review>(entityName: "Review")
        
        do {
            reviews = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
}


