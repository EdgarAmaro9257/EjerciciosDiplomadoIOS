//
//  CircleImage.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI

struct CircleImage: View {
    let image: String
    
    var body: some View {
        AsyncImage(url: URL(string: image))
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(Color.yellow,
                            lineWidth: 5)
            }
            .shadow(radius: 10)
            .frame(width: 250, height: 250)
    }
}

#Preview {
    CircleImage(image: pokedex[0].imageURL)
}
