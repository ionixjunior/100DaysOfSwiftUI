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
    @State private var isPresentAnswer = false
    @State private var answerMessage = ""
    @State private var remainingRounds = 10

    let moves: [Object] = [.rock, .paper, .scissors]
    let maxRounds = 10



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
                        makeUser(choice: .rock)
                    }

                    GameButton(text: "📄") {
                        makeUser(choice: .paper)
                    }

                    GameButton(text: "✂️") {
                        makeUser(choice: .scissors)
                    }
                }
                .alert("Your answer", isPresented: $isPresentAnswer) {
                    if (remainingRounds == 1) {
                        Button("Restart") {
                            appCurrentChoice = makeAppCurrentChoice()
                            shouldWin = makeShouldWin()
                            remainingRounds = 10
                            score = 0
                        }
                    } else {
                        Button("Next") {
                            appCurrentChoice = makeAppCurrentChoice()
                            shouldWin = makeShouldWin()
                            remainingRounds -= 1
                        }
                    }
                } message: {
                    if (remainingRounds == 1) {
                        Text(answerMessage)
                        +
                        Text("\nThe game is over.")
                        +
                        Text("\nYour score is \(score).")
                    } else {
                        Text(answerMessage)
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

    private func makeUser(choice userChoice: Object) {
        guard let shouldWin = shouldWin else { return }

        if (appCurrentChoice == .rock && userChoice == .paper && shouldWin)
            || (appCurrentChoice == .rock && userChoice == .scissors && !shouldWin)
            || (appCurrentChoice == .paper && userChoice == .scissors && shouldWin)
            || (appCurrentChoice == .paper && userChoice == .rock && !shouldWin)
            || (appCurrentChoice == .scissors && userChoice == .rock && shouldWin)
            || (appCurrentChoice == .scissors && userChoice == .paper && !shouldWin) {
            score += 1
            answerMessage = "Your answer is correct!"
        } else {
            score -= 1
            answerMessage = "Your answer is wrong!"
        }

        isPresentAnswer = true
    }
}

#Preview {
    ContentView()
}
