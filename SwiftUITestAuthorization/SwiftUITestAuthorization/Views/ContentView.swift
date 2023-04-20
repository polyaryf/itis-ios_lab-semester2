//
//  ContentView.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 07.04.2023.
//

import SwiftUI

class NavigationObject: ObservableObject {
    @Published
    var path: NavigationPath = .init()
}

struct ContentView: View {
    let admin: User = .init(username: "Admin", password: "123")
    
    @State
    var username: String = ""
    @State
    var password: String = ""
    
    @State
    var showTabBarPage: Bool = false
    @State
    var showAlertFailure: Bool = false

    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Login")
                    .textInputAutocapitalization(.words)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 7)
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 7)
                
                Text("Password")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .padding(.horizontal, 7)
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 7)
            
            }
            .padding(.bottom, 100)
            .padding(.horizontal, 15)

            
            Button("Sign In") {
                guard username == admin.username &&
                        password == admin.password else {
                    showAlertFailure = true
                    return
                }
                showTabBarPage.toggle()
            }
            .fullScreenCover(isPresented: $showTabBarPage) {
                TabBarPage(user: admin, showTabBarPage: $showTabBarPage)
            }
            .buttonStyle(.borderedProminent)
            .alert(
                "Wrong username or passwod", isPresented: $showAlertFailure
            ) {
                Button("Ok") {
                    username = ""
                    password = ""
                }
            }
        }
        .padding([.top, .bottom])
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
