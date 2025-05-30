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

let GratificationPrompts: [String] = [
    
]

@Model class Reflection {
    var name: String = ""
    var pinned: Bool = false
    let prompt: Prompt
    //var date: Date
    
    var recording: Recording
    var writing: String = ""
    
    init(name: String, prompt: Prompt, recording: Recording) {
        self.name = name
        self.prompt = prompt
        self.recording = recording
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
