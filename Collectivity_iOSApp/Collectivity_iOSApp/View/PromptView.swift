//
//  PromptView.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/21/25.
//

import SwiftUI
import SwiftData


struct PromptView: View {
    let user = User.data
    let prompt: Prompt
    //@State var isShowing: Bool = false
    var body: some View {
        VStack{
            Text("\(prompt.desc)")
            
            Text("Reflection")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            Button{
                
            }label:{
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .cornerRadius(10)
                    .foregroundStyle(.gblue)
                    .padding()
            }
            Text("More Information")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ForEach(prompt.infoArray){ info in
                @State var isShowing: Bool = false
                VStack{
                    HStack{
                        Text("\(info.nameOfCategory)")
                        Spacer()
                        Button{
                            //info.isShowing.toggle()
                        }label:{
                            Image(systemName: info.isShowing ? "chevron.down" : "chevron.right")
                            
                        }
                        
                    }
                    .padding(.vertical)
                    if(isShowing == true){
                        Text("\(info.descriptionOfCategory)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                        
                }
                
                
                .padding()
            }
        }
        
    }
}

#Preview {
    PromptView(prompt: Prompt(name: "Communication", category: .communication))
}
