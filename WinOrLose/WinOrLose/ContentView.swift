//
//  ContentView.swift
//  WinOrLose
//
//  Created by Ione Souza Junior on 25/07/24.
//

import SwiftUI

enum Object {
    case rock, paper, scissors
}

struct ContentView: View {
    @State private var appCurrentChoice: Object? = Object.rock
    @State private var shouldWin: Bool? = true
    @State private var score = 0

    let moves: [Object] = [.rock, .paper, .scissors]

    var body: some View {
        if (appCurrentChoice == nil && shouldWin == nil) {
            Button("Start game") {
                appCurrentChoice = makeAppCurrentChoice()
                shouldWin = makeShouldWin()
            }
        } else {
            VStack {
                Text("Your score is \(score)")
                Text("The app's move is \(appCurrentChoice ?? .rock)")
                Text("You should \(shouldWin ?? false ? "win" : "loose")")

                HStack {
                    GameButton(text: "🪨") {
                        print("tapped on rock")
                    }

                    GameButton(text: "📄") {
                        print("tapped on paper")
                    }

                    GameButton(text: "✂️") {
                        print("tapped on scissors")
                    }
                }
            }
        }
    }

    private func makeAppCurrentChoice() -> Object {
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
