//
//  Prospects.swift
//  HotProspects
//
//  Created by Garret Poole on 5/7/22.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    //read from anywhere modify only from this file (why Prospect and Prospects in same file)
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        people = []
    }
    
    func toggle(_ prospect: Prospect) {
        //call before changing values to get right animations
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
