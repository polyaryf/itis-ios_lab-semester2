//
//  TabBarPage.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 20.04.2023.
//

import SwiftUI

struct TabBarPage: View {
    let user: User
    
    @Binding
    var showTabBarPage: Bool
    
    var body: some View {
        TabView {
            HomePage(username: user.username).tabItem {
                Label("Home", systemImage: "house")
            }
            
            ExitPage(username: user.username, showTabBarPage: self.$showTabBarPage).tabItem {
                Label("Exit", systemImage: "door.left.hand.open")
            }
        }
    }
}
