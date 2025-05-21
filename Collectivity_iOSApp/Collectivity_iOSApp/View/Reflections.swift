//
//  DailyGratitude.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/12/25.
//

import SwiftUI
import SwiftData

struct Reflections: View {
    @Environment(\.modelContext) private var context
    @Query var reflections: [Reflection]
    
    var timer = Timer.publish(every: 3, on: .main, in: .common)
    
    @State var viewLog: Bool = false
    @State var index: Int = 0
    @State var pinnedReflections: [Reflection] = []
    @State var windowTouched: Bool = false
    
    var body: some View {
        
        NavigationStack{
            NavigationLink(){
                Log()
            }label:{
                SectionTitle(title: "Reflections")
            }
                VStack{
                    Text(pinnedReflections.isEmpty || pinnedReflections.count < index  ? "" : pinnedReflections[index].name)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 100)
                        .padding(.horizontal)
                        .border(.red)
                    HStack{
                        ForEach(pinnedReflections){ pos in
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
                }
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .cornerRadius(15)
                .padding()
        }
        .onReceive(timer.autoconnect()){ time in
            if !reflections.isEmpty && index < pinnedReflections.count - 1 {
                index += 1
            }else {
                index = 0
            }
        }
        .onReceive(reflections.filter{$0.pinned}.publisher){ group in
            pinnedReflections = reflections.filter{$0.pinned}
            if index >= pinnedReflections.count {
                index = 0
            }
        }
        .onAppear(){
            pinnedReflections = reflections.filter{$0.pinned}
        }
    }
}

#Preview {
    Reflections()
}
