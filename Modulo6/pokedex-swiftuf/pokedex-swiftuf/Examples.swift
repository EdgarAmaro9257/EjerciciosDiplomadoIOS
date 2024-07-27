//
//  Examples.swift
//  pokedex-swiftuf
//
//  Created by Alejandro Mendoza on 26/07/24.
//

import SwiftUI

//struct Examples: View {
//    // tipos opacos
//    var body: some View {
//        Text("I'm a text")
//            .foregroundStyle(.white)
//            .padding()
//            .background {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.black)
//            }
//            .debugType()
//    }
//}

//struct UnderlineView<Content: View>: View {
//    var content: Content
//    
//    var body: some View {
//        content
//            .overlay(alignment: .bottom) {
//                Rectangle()
//                    .frame(height: 1)
//            }
//    }
//}
//
//struct UnderlineViewModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .overlay(alignment: .bottom) {
//                Rectangle()
//                    .frame(height: 1)
//            }
//    }
//}
//
//extension View {
//    func underlined() -> some View {
//        modifier(UnderlineViewModifier())
//    }
//}
//
//struct Examples: View {
//    var body: some View {
//        UnderlineView(content: Text("hello, world!"))
//        UnderlineView(content: Image(systemName: "lizard"))
//        
//        Text("hello, world!")
//            .underlined()
//        Image(systemName: "lizard")
//            .underlined()
//    }
//}

//struct Examples: View {
//    let counter = 2
//    let optionalCounter: Int? = .some(1)
//    
//    var body: some View {
//        VStack {
//            switch counter > 0 {
//            case true:
//                Circle()
//            case false:
//                Rectangle()
//            }
//            
//            if let counter = optionalCounter {
//                Text("\(counter)")
//            }
//            
//            Button(action: {}) {
//                Text("Hi")
//            }
//        }
//        .debugType()
//        
//    }
//}

struct Examples: View {
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.blue)
            
            Text("A Simple text")
                .fixedSize(horizontal: false, vertical: true)
                .layoutPriority(1)
            
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.green)
        }
        .frame(width: 200, height: 40)
    }
}

extension View {
    func debugType() -> Self {
        let type = Mirror(reflecting: self).subjectType
        print(type)
        return self
    }
}

#Preview {
    Examples()
}
