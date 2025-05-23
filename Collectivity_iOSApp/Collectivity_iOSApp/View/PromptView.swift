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
    @State var isShowingSheet: Bool = false
    //let reflection: Reflection = Reflection(name: "", prompt: prompt)
    var body: some View {
        VStack{
            Text("\(prompt.desc)")
            Text("More Information")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            ForEach(prompt.infoArray.indices, id:\.self){ index in
                VStack{
                    HStack{
                        Text("\(prompt.infoArray[index].nameOfCategory)")
                        Spacer()
                        Button{
                            prompt.infoArray[index].isShowing.toggle()
                            print(prompt.infoArray[index].isShowing)
                            print("is Showing \(prompt.infoArray[index].isShowing)")
                        }label:{
                            Image(systemName: prompt.infoArray[index].isShowing ? "chevron.down" : "chevron.right")
                            
                        }
                        
                    }
                    .padding(.vertical)
                    if(prompt.infoArray[index].isShowing){
                        Text("\(prompt.infoArray[index].descriptionOfCategory)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                        
                }
                
                
                .padding()
            }
            Text("Reflection")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            HStack{
                Button{
                    
                }label:{
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .cornerRadius(10)
                        .foregroundStyle(.gblue)
                        .padding()
                }
                Button{
                    isShowingSheet.toggle()
                }label:{
                    Rectangle()
                        
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .cornerRadius(10)
                        .foregroundStyle(.gblue)
                        .padding()
                }
                
            }
            .sheet(isPresented: $isShowingSheet){
                VoiceRecordingView(prompt: prompt)
            }
        }
        
        
    }
}

#Preview {
    PromptView(prompt: Prompt(name: "Communication", category: .communication))
}
