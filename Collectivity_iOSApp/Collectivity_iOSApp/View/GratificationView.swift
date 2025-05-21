//
//  GratificationView.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/20/25.
//

import SwiftUI




struct GratificationView: View{
    
    var userData = User.data
    @State var text: [String]
    
    let today = Date.now
    var body: some View {
        
        ScrollView{
            
            ZStack{
                
                VStack(spacing: 15){
                    Text("Daily Gratitude")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(today.formatted(date: .long, time:.omitted))")
                        .font(.caption)
                    
                    Text("What are you grateful for today?")
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 70)
            .padding(.bottom, 35)
            .padding()
            .background(.gblue)
            HStack{
                ForEach(userData.dailyGratification, id: \.self){ dg in
                    Image(systemName: dg.isEmpty ? "circle" : "circle.fill")
                    //.foregroundStyle(dg.isEmpty ? .black : .clear)
                        .padding()
                }
            }
            
            ForEach(userData.dailyGratification.indices, id: \.self){ dg in
                TextField("I'm grateful for..." ,text: $text[dg])
                    .modifier(GratitudeModifier(hasText: text[dg].isEmpty))
                    .onChange(of: text[dg]){
                        userData.dailyGratification[dg] = text[dg]
                    }
            }
            
        }
        .onAppear(){
            text = userData.dailyGratification
        }
        .ignoresSafeArea()
    }
}





#Preview {
    GratificationView(text: ["","",""])
}



