//
//  ContentView.swift
//  HotProspects
//
//  Created by Garret Poole on 4/29/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Taylor")
            //hidden to user by default so dont hide crucial actions in them
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
