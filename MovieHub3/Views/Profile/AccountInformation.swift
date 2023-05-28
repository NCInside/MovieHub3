//
//  AccountInformation.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//

import SwiftUI

struct AccountInformation: View {
    @State private var email: String = "john.doe@example.com"
    @State private var password: String = "password123"
    @State private var phone: String = "1234567890"
    @State private var profilePic: String = "profile.jpg"
    @State private var name: String = "John Doe"
    @State private var age: String = "30"
    @State private var location: String = "New York"
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Account Information")
                        .font(.title)
                        .foregroundColor(.white)
                    AttributeTextField(title: "Name", text: $name)
                    AttributeTextField(title: "Age", text: $age)
                        .keyboardType(.numberPad)
                    AttributeTextField(title: "Location", text: $location)
                    AttributeTextField(title: "Email", text: $email)
                    AttributeSecureField(title: "Password", text: $password)
                    AttributeTextField(title: "Phone", text: $phone)
//                    AttributeTextField(title: "Profile Picture", text: $profilePic)
                 
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.vertical, 40)
            .foregroundColor(.white)
        }
        .accentColor(.red) // Set the accent color to red
    }
}

struct AttributeTextField: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.red) // Set the text color to red
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.red) // Set the text color to red
        }
    }
}

struct AttributeSecureField: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.red) // Set the text color to red
            
            SecureField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.red) // Set the text color to red
        }
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformation()
    }
}
