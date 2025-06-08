//
//  ContentView.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/19/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let today = Date.now
    @Environment(\.modelContext) var context
    @Query var fetchUser: [User]
    
    
    //@State var text: [String]
    
    var user: User {
        let newUser = User()
        if let gotUser = fetchUser.first {
            return gotUser
        }else{
            context.insert(newUser)
            return newUser
        }
    }
    
    @State var title = "Collectivity"
    
    var body: some View {
        NavigationStack {
            ScrollView{
                StreakBar()
                DailyGratitude(user: user)
                Prompts(user: user)
                Reflections(user: user)
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
