//
//  DailyGratitude.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/12/25.
//

import SwiftUI

struct Reflections: View {
    var timer = Timer.publish(every: 3, on: .main, in: .common)
    
    @State var user: User
    @State var viewLog: Bool = false
    @State var index: Int = 0
    @State var reflections: [Reflection] = []
    @State var pinnedReflections: [Reflection] = []
    @State var windowTouched: Bool = false
    
    var body: some View {
        
        NavigationStack{
            
            SectionTitle(title: "Reflections")
            NavigationLink(destination: Log(user: user)){
                VStack{
                   if !pinnedReflections.isEmpty{
                       
                    Text(pinnedReflections.isEmpty || pinnedReflections.count < index  ? "" : pinnedReflections[index].name)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 100)
                        .padding(.horizontal)
                        .border(.red)
                       
                        HStack{
                            ForEach(pinnedReflections, id: \.name ){ pos in
                                Circle()
                                    .fill(pinnedReflections.firstIndex(of: pos) == index ? .white : .clear)
                                    .stroke(.black, lineWidth: 5)
                                    .scaledToFit()
                                    .padding()
                            }
                        }
                       
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .border(.green)
                   }else{
                       Image(systemName: "plus")
                           .padding()
                           .foregroundStyle(.black)
                       Text("Add pinned reflections")
                           .foregroundStyle(.black)
                   }
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .background(pinnedReflections.isEmpty ? .clear :.white)
                .cornerRadius(15)
                .padding()
            }
        }
        .onReceive(timer.autoconnect()){ time in
            if !user.reflections.isEmpty && index < pinnedReflections.count - 1 {
                withAnimation {
                    index += 1
                }
            } else {
                index = 0
            }
        }
        .onReceive(user.reflections.filter{$0.pinned}.publisher){ group in
            pinnedReflections = user.reflections.filter{$0.pinned}
            if index >= pinnedReflections.count {
                index = 0
            }
        }
        .onAppear {
            pinnedReflections = user.reflections.filter{$0.pinned}
        }
    }
}

#Preview {
    Reflections(user: User())
}
