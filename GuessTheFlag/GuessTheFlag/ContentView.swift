//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ione Souza Junior on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var flags = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State var showAnswerAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var score = 0

    let maxNumberQuestions = 8
    @State var currentQuestion = 1
    @State var showFinishGameAlert = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)

            VStack {
                Text("Select the flag of")
                Text(flags[correctAnswer])

                VStack(spacing: 20) {
                    ForEach(0..<3) { flag in
                        Button {
                            showAnswer(flag)
                        } label: {
                            Image(flags[flag])
                                .clipShape(Capsule())
                        }
                    }
                }

                Text("Your score is \(score)")
            }
        }
        .ignoresSafeArea()
        .alert(alertTitle, isPresented: $showAnswerAlert, actions: {
            Button("Next") {
                showNextQuestion()
            }
        }, message: {
            Text(alertMessage)
        })
        .alert(alertTitle, isPresented: $showFinishGameAlert, actions: {
            Button("Restart") {
                restartGame()
            }
        }, message: {
            Text(alertMessage)
            +
            Text(" The game was finished.")
        })
    }

    private func showAnswer(_ selectedFlag: Int) {
        if correctAnswer == selectedFlag {
            score += 1
            alertTitle = "Correct answer"
            alertMessage = "Your score is \(score)."
        } else {
            score -= 1
            alertTitle = "Wrong answer"
            alertMessage = "That's the flag of \(flags[selectedFlag]).\nYour score is \(score)."
        }

        if currentQuestion >= maxNumberQuestions {
            showFinishGameAlert = true
        } else {
            showAnswerAlert = true
        }
    }

    private func showNextQuestion() {
        currentQuestion += 1
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    private func restartGame() {
        currentQuestion = 1
        score = 0
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
