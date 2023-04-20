//
//  ExitPage.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 20.04.2023.
//

import SwiftUI

struct ExitPage: View {
    let username: String
    
    @Binding
    var showTabBarPage: Bool
    
    var body: some View {
        VStack {
            Text("Hello, \(username)")
                .font(.title2)
                .foregroundColor(.blue)
                .padding(EdgeInsets(
                    top: 150,
                    leading: 40,
                    bottom: 0,
                    trailing: 40
                    )
                )
            Button("Sign Out") {
                self.showTabBarPage.toggle()
            }
            .frame(width: 300, height: 40, alignment: .topLeading)
            .buttonStyle(.borderedProminent)
        }
    }
}
