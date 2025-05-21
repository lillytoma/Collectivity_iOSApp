//
//  File.swift
//  Collectivity_iOSApp
//
//  Created by Clyde Jackson on 5/21/25.
//

import SwiftUI

struct BgModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .foregroundStyle(.white)
            .padding()
            .background(.gray)
            .cornerRadius(15)
    }
}


struct GratitudeModifier: ViewModifier {
    
    var hasText: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(height: 45, alignment: .center)
            .padding()
            .background(.babyblue)
            .opacity( hasText ? 0.45 : 0.75)
            .cornerRadius(8)
            .padding()
    }
}
