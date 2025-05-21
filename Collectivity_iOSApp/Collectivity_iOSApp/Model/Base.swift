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

class Prompt: Identifiable{
    let id: UUID = UUID()
    let name: String
    let category: categories
    let isComplete: Bool = false
    let suggestion: String = ""
    let desc: String = ""
    let pros: String = ""
    let cons: String = ""
    let funFact: String = ""
    var infoArray: [infoStruct] = [
        infoStruct( nameOfCategory: "suggestion", descriptionOfCategory: "Give me a grape"),
        infoStruct( nameOfCategory: "pros", descriptionOfCategory: "Give me a pro"),
        infoStruct( nameOfCategory: "cons", descriptionOfCategory: "Give me a con"),
        infoStruct( nameOfCategory: "fun fact", descriptionOfCategory: "Give me a fact")
    ]
    init(name: String, category: categories) {
        self.name = name
        self.category = category
    }
}

struct infoStruct: Identifiable{
    let id: UUID = UUID()
    let nameOfCategory: String
    let descriptionOfCategory: String
    let isShowing: Bool = false
    
    init(nameOfCategory: String, descriptionOfCategory: String) {
        self.nameOfCategory = nameOfCategory
        self.descriptionOfCategory = descriptionOfCategory
    }
}
