//
//  StreakBar.swift
//  Collectivity_iOSApp
//
//  Created by Hamza Crichlow on 5/28/25.
//

import SwiftUI

enum Days: String {
case Sunday
case Monday
case Tuesday
case Wednesday
case Thursday
case Friday
case Saturday
}


struct StreakBar: View {
    
    let days: [Days] = [.Sunday, .Monday, .Tuesday, .Wednesday, .Thursday, .Friday, .Saturday]
    
    var body: some View {
      
     
        HStack(spacing: 15){
                    ForEach(days, id: \.self){ day in
                        ZStack{
                            Circle().fill(Color.white)
                                .shadow(radius: 0.5, y: 1)
                            Text(day.rawValue.prefix(1))
                            
                                
                               
                        }
                        
                    }
                }
                .padding()
            
        
    }
}



#Preview {
    StreakBar()
}
