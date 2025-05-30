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
            .background(hasText ? .gray.opacity(0.5) : .babyblue)
            .opacity( hasText ? 0.45 : 0.75)
            .cornerRadius(8)
            .padding()
    }
}

struct navModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar(){
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                }
            }
    }
}
