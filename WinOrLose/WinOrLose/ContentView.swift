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
    @State private var score = 0

    let moves = ["rock", "paper", "scissors"]

    var body: some View {
        if (appCurrentChoice == nil && shouldWin == nil) {
            Button("Start game") {
                appCurrentChoice = makeAppCurrentChoice()
                shouldWin = makeShouldWin()
            }
        } else {
            VStack {
                Text("Your score is \(score)")
            }
        }
    }

    private func makeAppCurrentChoice() -> String {
        let random = Int.random(in: 0..<moves.count)
        return moves[random]
    }

    private func makeShouldWin() -> Bool {
        return Bool.random()
    }
}

#Preview {
    ContentView()
}
