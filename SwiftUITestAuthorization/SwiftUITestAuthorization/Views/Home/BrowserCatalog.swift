//
//  BrowserCatalog.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 20.04.2023.
//

import SwiftUI

struct BrowserCatalog: View {
    var pageId: Int
    
    @ObservedObject
    var navigationObject: NavigationObject
    
    var body: some View {
        NavigationStack(path: $navigationObject.path) {
            VStack {
                Text("catalog, page: \(pageId)")
                    .padding(.bottom, 100)
                    .font(.title3)
                Button("Browse catalog") {
                    navigationObject.path
                        .append(CatalogPage(id: pageId))
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 300)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .navigationDestination(for: CatalogPage.self) { page in
            BrowserCatalog(pageId: page.id, navigationObject: navigationObject)
        }
    }
}

struct BrowserCatalog_Previews: PreviewProvider {
    static var previews: some View {
        BrowserCatalog(pageId: 1, navigationObject: .init())
    }
}
