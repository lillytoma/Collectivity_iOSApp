//
//  Recording.swift
//  Collectivity_iOSApp
//
//  Created by Lilly Toma on 5/8/25.
//
//creating branch
import Foundation
import SwiftUI
import SwiftData
import Combine



//@Model
@Observable class Reflection: Codable, Identifiable, Equatable{
    static func == (lhs: Reflection, rhs: Reflection) -> Bool {
        lhs.id == rhs.id 
    }
    
    let id: UUID = UUID()
    var name: String = ""
    var pinned: Bool = false
    let prompt: Prompt
    //var date: Date
    
    var recording: Recording?
    var entry: String = ""
    
    init(name: String, prompt: Prompt) {
        self.name = name
        self.prompt = prompt
    }
}

struct Recording: Identifiable, Equatable, Codable {
    let id = UUID()
    let url: URL
    let date: Date
    let sequence: Int
    
    
    //formatted date string for display
    var formattedDate: String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
        
    
//    //Equatable conformance, do we need this??
//    static func == (lhs: Recording, rhs: Recording) -> Bool{
//        return lhs.id == rhs.id
//    }
    
}
