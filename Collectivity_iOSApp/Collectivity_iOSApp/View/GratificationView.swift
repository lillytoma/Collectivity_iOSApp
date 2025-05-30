//
//  GratificationView.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/20/25.
//

import SwiftUI




struct GratificationView: View{
    @Environment(\.dismiss) var dismiss
    var userData = User.data
    @State var text: [String]
    
    let today = Date.now
    var body: some View {
        NavigationStack{
            ScrollView{
                
                ZStack{
                    
                    VStack(spacing: 15){
                        Text("Daily Gratitude")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("\(today.formatted(date: .long, time:.omitted))".uppercased())
                            .font(.caption)
                        
                        Text("\(userData.gratificationPrompt)")
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 70)
                .padding(.bottom, 35)
                .padding()
                .background(.gblue)
                
                ForEach(userData.dailyGratification.indices, id: \.self){ dg in
                    TextField("I'm grateful for..." ,text: $text[dg])
                        .modifier(GratitudeModifier(hasText: text[dg].isEmpty))
                        .onChange(of: text[dg].isEmpty){ con in
                            if  !text[dg].isEmpty {
                                text[dg] = "I'm grateful for " + text[dg]
                            }
                        }
                        .onChange(of: text[dg]){
                            userData.dailyGratification[dg] = text[dg]
                        }
                }
                
                Button("Save Gratitude"){
                    
                }
                .foregroundStyle(.black)
                .padding()
                .padding(.horizontal)
                .background(.gblue)
                .cornerRadius(10)
                .padding(.top, 30)
            }
            
            .ignoresSafeArea()
        }
        .modifier(navModifier())
    }
}





#Preview {
    GratificationView(text: ["","",""])
}



