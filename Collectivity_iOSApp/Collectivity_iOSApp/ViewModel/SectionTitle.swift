//
//  BgModifier.swift
//  Collectivity_iOSApp
//
//  Created by Clyde Jackson on 5/21/25.
//
import SwiftUI

struct SectionTitle: View {
    let title: String
    var destination: (any View)?
    
    var body: some View {
        NavigationStack{
            
            Text(title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
        
}
