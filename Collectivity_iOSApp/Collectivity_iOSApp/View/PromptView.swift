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
    @State var prompt: Prompt
    @State var isShowing: Bool = false
    var body: some View {
        ScrollView{
            VStack{
                Text("\(prompt.desc)")
                
                Text("Reflection")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Button{
                    isShowing.toggle()
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
                ForEach(prompt.infoArray.indices, id:\.self){ index in
                    VStack(){
                        HStack{
                            Text("\(prompt.infoArray[index].nameOfCategory)")
                            Spacer()
                            Button{
                                prompt.infoArray[index].isShowing.toggle()
                                print(prompt.infoArray[index].isShowing)
                            }label:{
                                Image(systemName: prompt.infoArray[index].isShowing ? "chevron.down" : "chevron.right")
                                
                            }
                            
                        }
                        .padding(.vertical)
                        if(prompt.infoArray[index].isShowing){
                            Divider()
                            Text("\(prompt.infoArray[index].descriptionOfCategory)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    //.padding()
                    
                }
                .sheet(isPresented: $isShowing){
                    
                }
            }
        }
    }
}

#Preview {
    PromptView(prompt: Prompt(name: "Communication", category: .communication))
}
