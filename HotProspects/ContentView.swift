//
//  ContentView.swift
//  HotProspects
//
//  Created by Garret Poole on 4/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        //result will hold the entire success or entire error inside of itself which can then be stored and passed until ready to use
        let result = await fetchTask.result
//        do {
//            output = try result.get()
//        } catch {
//            print("Download error")
//        }
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download Error: \(error.localizedDescription)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
