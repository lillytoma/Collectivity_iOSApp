//
//  DailyGratitude.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/12/25.
//

import SwiftUI

struct DailyGratitude: View {
    let user: User
    
    var body: some View {
        NavigationStack{
            
            SectionTitle(title: "Daily Gratification")
            NavigationLink(destination: GratificationView(text: user.dailyGratification)){
                
                VStack {
                    Text("\(user.gratificationPrompt)")
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    VStack{
                        Text("\(Date.now.formatted(date: .long, time:.omitted))".uppercased())
                            .padding(.horizontal)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.caption)
                            .foregroundStyle(.black)
                        HStack{
                            Text("Tap to record today's gratitiude.")
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Image(systemName: "pencil.line")
                                .foregroundStyle(.black)
                                .font(.title2)

                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        //ForEach(user.dailyGratification, id: \.self){ dg in
                         //   if !dg.isEmpty {
                         //       Text(dg)
                         //           .foregroundStyle(.black)
                         //   }
                        //}
                    }
                    .frame(maxWidth: .infinity)
                    .background(.blue.opacity(0.2))
                }
                .frame(maxWidth: .infinity)
                .background(.gblue)
                .cornerRadius(15)
                .padding()
                
            }
        }
    }
}

#Preview {
    DailyGratitude(user: User.data)
}
