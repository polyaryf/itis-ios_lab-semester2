//
//  Animal.swift
//  SwiftUITestAuthorization
//
//  Created by Полина Рыфтина on 20.04.2023.
//

import SwiftUI

struct Animal: View {
    
    var body: some View {
        VStack {
            Image("cat")
                .resizable()
                .scaledToFit()
        }
    }
}

struct Animal_Previews: PreviewProvider {
    static var previews: some View {
        Animal()
    }
}
