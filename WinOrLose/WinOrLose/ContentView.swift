//
//  ContentView.swift
//  WinOrLose
//
//  Created by Ione Souza Junior on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var appCurrentChoice: String?

    let moves = ["rock", "paper", "scissors"]

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
