//
//  ContentView.swift
//  WinOrLose
//
//  Created by Ione Souza Junior on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var appCurrentChoice: String?
    @State private var shouldWin: Bool?

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

    private func makeAppCurrentChoice() -> String {
        let random = Int.random(in: 0..<moves.count)
        return moves[random]
    }
}

#Preview {
    ContentView()
}
