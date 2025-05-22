//
//  Prompts.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/12/25.
//

import SwiftUI

struct Prompts: View {
    let data = User.data
    
    var body: some View {
        NavigationStack{
           // ScrollView(.horizontal){
            SectionTitle(title: "Prompts")
                HStack(){
            //TabView{
                    ForEach(data.prompts){ prompt in
                        NavigationLink(destination: PromptView(prompt: prompt)){
                            Text(prompt.name)
                                .frame(maxWidth: .infinity,maxHeight: .infinity)
                                .padding()
                                .background(.gray)
                                .cornerRadius(15)
                        }
                        
                    }
                }
            
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .padding()
            //.padding(.horizontal, 15)
            //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

#Preview {
    Prompts()
}
