//
//  Base.swift
//  Collectivity_iOSApp
//
//  Created by Clyde Jackson on 5/21/25.
//

import Foundation
import Observation
import SwiftData

enum categories{
    case communication
    case empathy
    case awareness
}

@Observable class User{
    static let data = User()
    
    var navTitle: String = ""
    
    var dailyGratification : [String] = ["","",""]
    
    var prompts: [Prompt] = [
        Prompt(name: "Good", category: .communication),
        Prompt(name: "Bad", category: .empathy),
        Prompt(name: "Ugly", category: .awareness)
    ]
    
    var selectedPrompt: categories?
    
    private init() {}
}

@Model class Reflection {
    var name: String = ""
    var pinned: Bool = false
    
    init(name: String) {
        self.name = name
    }
}

struct Prompt: Identifiable{
    let id: UUID = UUID()
    let name: String
    let category: categories
    let isComplete: Bool = false
    let desc: String = ""
}
