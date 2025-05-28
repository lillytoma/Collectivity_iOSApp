//
//  ContentView.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/19/25.
//

import SwiftUI

struct ContentView: View {
    let today = Date.now
    let userData = User.data
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                StreakBar()
                DailyGratitude(user: userData)
                Prompts()
                Reflections()
            }
            .scrollIndicators(.hidden)
//            .navigationTitle("\(today.formatted(date: .long, time:.omitted))")
            .navigationTitle("Collectivity")
            
            .background(Color(UIColor.systemGray6))
        }
        
        .preferredColorScheme(.light)
        
    }
}

#Preview {
    ContentView()
}
