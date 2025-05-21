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
            NavigationLink(destination: GratificationView(text: user.dailyGratification)){
                SectionTitle(title: "Daily Gratification")
            }
            VStack {
                ForEach(user.dailyGratification, id: \.self){ dg in
                    Text(dg)
                }
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .background(.gray)
            .cornerRadius(15)
            .padding()
        }
    }
}

//#Preview {
//    DailyGratitude()
//}
