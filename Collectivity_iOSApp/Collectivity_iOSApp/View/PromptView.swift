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
    @State var isShowingRecordJournal: Bool = false
    var body: some View {
        ScrollView{
            ZStack{
                
                VStack(spacing: 15){
                    Text("\(prompt.category)")
                        .font(.title)
                        .fontWeight(.bold)
                    //Text("\(today.formatted(date: .long, time:.omitted))")
                        .font(.caption)
                    
                    Text("\(prompt.name)")
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.bottom, 35)
            .padding()
            .background(getActivityColor(category: prompt.category))
            VStack{
                
                
                Text("More Information")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ForEach(prompt.infoArray.indices, id:\.self){ index in
                    if prompt.infoArray[index].nameOfCategory != .journalReflection{
                        VStack(){
                            Button{
                                
                                prompt.infoArray[index].isShowing.toggle()
                            }label: {
                                HStack{
                                    Text("\(prompt.infoArray[index].nameOfCategory.rawValue  )")
                                        .foregroundStyle(.black)
                                    Spacer()
                                    
                                    Image(systemName: prompt.infoArray[index].isShowing ? "chevron.up" : "chevron.down")
                                        .foregroundStyle(.black)
                                }
                            }
                            .padding()
                            if(prompt.infoArray[index].isShowing){
                                Divider()
                                Text("\(prompt.infoArray[index].descriptionOfCategory)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                            
                        }
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        //.padding()
                        
                    }
                    
                    
                    
                }
                
                Button(){
                    isShowingRecordJournal.toggle()
                }label:{
                    Text("Record Journal")
                        .padding()
                        .padding(.horizontal)
                        .background(getActivityColor(category: prompt.category))
                        .cornerRadius(10)
                        .padding(.top, 30)
                }
                .sheet(isPresented: $isShowingRecordJournal) {
                    RecordJournalView(prompt: prompt, color: getActivityColor(category: prompt.category))
                }
            }
            
            
        }
        .ignoresSafeArea()
        .background(Color(UIColor.systemGray6))
        .modifier(navModifier())
    }
}

#Preview {
    PromptView(prompt: PromptsInformation[0])
}
