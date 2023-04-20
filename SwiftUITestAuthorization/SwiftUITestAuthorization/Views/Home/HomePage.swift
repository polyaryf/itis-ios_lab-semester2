//
//  HomePage.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 20.04.2023.
//

import SwiftUI

struct HomePage: View {
    let username: String
    var id = 0
    
    @State
    var showAnimal: Bool = false
    
    @ObservedObject
    var navigationObject: NavigationObject = .init()
    
    var body: some View {
        NavigationStack(path: $navigationObject.path) {
            VStack(alignment: .center) {
                
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
                
                Button("Browse catalog") {
                    navigationObject.path
                        .append(CatalogPage(id: id))
                }
                .frame(width: 300, height: 40, alignment: .topLeading)
                .buttonStyle(.borderedProminent)
                
                Button("Animal images") {
                    showAnimal.toggle()
                }
                .sheet(isPresented: $showAnimal) {
                    Animal()
                }
                .frame(width: 300, height: 40, alignment: .topLeading)
                .buttonStyle(.borderedProminent)
            }
            .padding(EdgeInsets(
                top: 0,
                leading: 50,
                bottom: 300,
                trailing: 50
                )
            )
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(Color.white)
            .navigationDestination(for: CatalogPage.self) { page in
                BrowserCatalog(pageId: page.id + 1, navigationObject: navigationObject)
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(username: "admin")
    }
}
