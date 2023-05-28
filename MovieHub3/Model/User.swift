//
//  User.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//

import Foundation
struct User: Codable {
    let id: String
    let email: String
    let password: String
    let phone: String
    let profilePic: String
    let name: String
    let age: Int
    let location: String
    var likedMovies: [Int]
}
