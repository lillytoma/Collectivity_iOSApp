//
//  Log.swift
//  NavTest
//
//  Created by Clyde Jackson on 5/14/25.
//

import SwiftUI
import SwiftData

struct Log: View {
    @Environment(\.modelContext) var context
    var user: User
    
    @State private var text: String = ""
    
    var body: some View {
        HStack{
            TextField("Make new reflection", text: $text)
                .font(.title)
            Button{
                if text.isEmpty {return}
                let reflection = Reflection(name: text, prompt: PromptsInformation[0])
                user.reflections.append(reflection)
                //context.insert(reflection)
                text = ""
            }label: {
                Image(systemName: "plus")
                    .font(.title)
            }
        }
        .padding()
        List(user.reflections, id: \.id){ reflection in
            HStack{
                Text(reflection.name)
                Spacer()
                Image(systemName: !reflection.pinned ? "bookmark" : "bookmark.fill")
                    .onTapGesture {
                        if let idx = user.reflections.firstIndex(of: reflection) {
                            user.reflections[idx].pinned.toggle()
                        }
                         
                    }
            }
            .swipeActions(){
                Button("Delete",systemImage: "trash",role: .destructive){
                    if let pos = user.reflections.firstIndex(of: reflection) {
                        user.reflections.remove(at: pos)
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    Log(user: User())
}
