////
////  Log.swift
////  NavTest
////
////  Created by Clyde Jackson on 5/14/25.
////
//
//import SwiftUI
//import SwiftData
//
//struct Log: View {
//    @Environment(\.modelContext) private var context
//    @Query private var reflections: [Reflection]
//    
//    @State private var text: String = ""
//    
//    var body: some View {
//        HStack{
//            TextField("Make new reflection", text: $text)
//                .font(.title)
//            Button{
//                if text.isEmpty {return}
//                let reflection = Reflection(name: text)
//                context.insert(reflection)
//                text = ""
//            }label: {
//                Image(systemName: "plus")
//                    .font(.title)
//            }
//        }
//        .padding()
//        List(reflections){ reflection in
//            HStack{
//                Text(reflection.name)
//                Spacer()
//                Image(systemName: !reflection.pinned ? "bookmark" : "bookmark.fill")
//                    .onTapGesture {
//                        reflection.pinned.toggle()
//                    }
//            }
//            .swipeActions(){
//                Button("Delete",systemImage: "trash",role: .destructive){
//                    context.delete(reflection)
//                }
//            }
//            .padding()
//        }
//        
//    }
//}
//
//#Preview {
//    Log()
//}
