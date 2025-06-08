//
//  Prompts.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/12/25.
//

import SwiftUI

struct Prompts: View {
    var user: User
    
    var body: some View {
        NavigationStack{
            // ScrollView(.horizontal){
            SectionTitle(title: "Activities")
            ScrollView(.horizontal){
                HStack(){
                    //TabView{
                    ForEach(user.prompts){ prompt in
                        NavigationLink(destination: PromptView(prompt: prompt)){
                            VStack{
                                Text("\(prompt.category.rawValue)")
                                    .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .leading)
                                   
                                    .bold()
                                    .font(.title3)
                                Text(prompt.name)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth:.infinity, alignment: .leading)
                                    .padding(.bottom)
                            }
                                .foregroundStyle(.black)
                               .frame(maxHeight: .infinity)
//                               .frame(width: 300)
                                .containerRelativeFrame(.horizontal, count: 2, spacing: -200)
                            
                                .padding()
                                .background(.white)
                                .cornerRadius(15)
                                .shadow(radius: 0.5, y: 1)
                              
                        }
                        
                    }
                }
                .scrollTargetLayout()
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .padding()
                //.padding(.horizontal, 15)
                //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .contentMargins(.horizontal, 0, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    Prompts(user: User())
}
