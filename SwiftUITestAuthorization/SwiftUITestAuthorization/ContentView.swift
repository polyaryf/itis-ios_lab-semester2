//
//  ContentView.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 07.04.2023.
//

import SwiftUI

struct ContentView: View {
    let keys: (login: String, password: String) = ("Admin", "123")
    
    @State
    var login: String = ""
    @State
    var password: String = ""
    
    @State
    var showAlertSuccess: Bool = false
    @State
    var showAlertFailure: Bool = false

    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Login")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                TextField("Login", text: $login)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 7)
                    
                Text("Password")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 7)
            
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            
            Button(action: {
                guard login == keys.login &&
                        password == keys.password else {
                    showAlertFailure = true
                    return
                }
                showAlertSuccess = true
                
            }) {
                Text("Sign In")
                    .frame(width: 200, height: 35)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    
            }
            .background(.white)
            .cornerRadius(5)
            
            .alert(
                "You successfully logged in", isPresented: $showAlertSuccess
            ) {
                Button("OK") {}
            }
            .alert(
                "You are loser\n Try again", isPresented: $showAlertFailure
            ) {
                Button("Clean all") {
                    login = ""
                    password = ""
                }
                Button("Clean login") {
                    login = ""
                }
                Button("Clean passwod") {
                    password = ""
                }
            }
        }
        .padding([.top, .bottom])
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
