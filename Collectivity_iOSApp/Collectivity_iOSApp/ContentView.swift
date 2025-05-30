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
    @State var title = "Collectivity"
    
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
            //.navigationTitle(Image(.transAppLogo))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar(){
                ToolbarItem(placement: .principal){
                    //ZStack{
                    
                    HStack{
                        
                        Image(.transAppLogo)
                            .resizable()
                            .scaledToFit()
                            .padding(.vertical, 1)
                        Text("Collectivity".uppercased())
                            .font(.caption)
                        
                        Spacer()
                        Image(systemName: "shield")
                            .font(.caption)
                    }
                    //}
                }
            }
            .background(Color(UIColor.systemGray6))
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
