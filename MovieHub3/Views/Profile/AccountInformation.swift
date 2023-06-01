//
//  AccountInformation.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//
import SwiftUI

struct AccountInformation: View {
    @EnvironmentObject private var userController: UserController
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    @State private var profilePic: String = ""
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var location: String = ""
    
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
                }
                .accentColor(.red)
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.vertical, 40)
            .foregroundColor(.white)
        }
        .accentColor(.red) // Set the accent color to red
        .navigationBarItems(trailing: Button(action: saveUserData) {
            Text("Save")
                .foregroundColor(.red)
        })
        .accentColor(.red) 
        .onAppear {
            loadUserData()
        }
    }
    
    private func loadUserData() {
        let user = userController.user
        email = user.email
        password = user.password
        phone = user.phone
        profilePic = user.profilePic
        name = user.name
        age = String(user.age)
        location = user.location
    }
    
    private func saveUserData() {
        // Update the user data in the user controller
        userController.user.email = email
        userController.user.password = password
        userController.user.phone = phone
        userController.user.profilePic = profilePic
        userController.user.name = name
        userController.user.age = Int(age) ?? 0
        userController.user.location = location
        
        // Save the user data to UserDefaults using the user controller
        userController.saveUser()
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
            .environmentObject(UserController())
    }
}
