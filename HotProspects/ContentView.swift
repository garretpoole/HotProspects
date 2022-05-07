//
//  ContentView.swift
//  HotProspects
//
//  Created by Garret Poole on 4/29/22.
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibeNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibeNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
