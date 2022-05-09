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
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        //no saved data
        people = []
    }
    
    //dont allow other code to call save() directly, should only be called within add/toggle
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ propsect: Prospect) {
        people.append(propsect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        //call before changing values to get right animations
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
