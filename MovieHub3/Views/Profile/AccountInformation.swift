//
//  AccountInformation.swift
//  MovieHub3
//
//  Created by Vincent on 29/05/23.
//
import SwiftUI

struct AccountInformation: View {
    @EnvironmentObject private var userController: UserController
    @Environment(\.presentationMode) var presentationMode
    
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
                    #if os(iOS)
                        .keyboardType(.numberPad)
                    #endif
                    AttributeTextField(title: "Location", text: $location)
                    AttributeTextField(title: "Email", text: $email)
                    AttributeSecureField(title: "Password", text: $password)
                    AttributeTextField(title: "Phone", text: $phone)
                }
                .accentColor(.red)
                .padding(.horizontal, 20)
                #if os(macOS)
                Button(action: {
                    saveUserData()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.headline)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
                .background(Color(red: 217/255.0, green: 37/255.0, blue: 29/255.0))
                .buttonStyle(.plain)
                .cornerRadius(8)
                .padding(.top, 20)
                .padding(.horizontal, 30)
                .foregroundColor(Color.white)
                #endif
                Spacer()
            }
            .padding(.vertical, 40)
            .foregroundColor(.white)
        }
        .accentColor(.red)
        #if os(iOS)
        .navigationBarItems(trailing: Button(action: {
                       saveUserData()
                       presentationMode.wrappedValue.dismiss()
                   }){
            Text("Save")
                .foregroundColor(.red)
        })
        #endif
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
                .foregroundColor(.red)
            
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                #if os(macOS)
                .foregroundColor(.white)
                #elseif os(iOS)
                .foregroundColor(.black)
                #endif
            
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
                .foregroundColor(.red)
            
            SecureField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.red)
        }
    }
}

struct AccountInformation_Previews: PreviewProvider {
    static var previews: some View {
        AccountInformation()
            .environmentObject(UserController())
    }
}
