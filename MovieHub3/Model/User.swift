//
//  User.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//

import Foundation
struct User: Codable {
    var id: String
    var email: String
    var password: String
    var phone: String
    var profilePic: String
    var name: String
    var age: Int
    var location: String
}
