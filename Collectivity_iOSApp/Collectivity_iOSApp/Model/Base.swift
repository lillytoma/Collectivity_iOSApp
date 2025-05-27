//
//  Base.swift
//  Collectivity_iOSApp
//
//  Created by Clyde Jackson on 5/21/25.
//

import Foundation
import Observation
import SwiftData

enum categories: Codable{
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



class Prompt: Identifiable{
    var id: UUID = UUID()
    var name: String
    var category: categories
    var isComplete: Bool = false
    var suggestion: String = ""
    var desc: String = ""
    var pros: String = ""
    var cons: String = ""
    var funFact: String = ""
    

    
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

@Observable
class infoStruct: Identifiable, Codable{
    var id: UUID = UUID()
    let nameOfCategory: String
    let descriptionOfCategory: String
    var isShowing: Bool = false
    
    init(nameOfCategory: String, descriptionOfCategory: String) {
        self.nameOfCategory = nameOfCategory
        self.descriptionOfCategory = descriptionOfCategory
    }
}
