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
    @State var score = 0

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
                        }
                    }
                }

                scoreView
            }
        }
        .ignoresSafeArea()
        .alert(alertTitle, isPresented: $showAnswerAlert, actions: {
            Button("Next") {
                showNextQuestion()
            }
        }, message: {
            scoreView
        })
    }

    var scoreView: some View {
        Text("Your score is \(score)")
    }

    private func showAnswer(_ selectedFlag: Int) {
        if correctAnswer == selectedFlag {
            alertTitle = "Correct answer"
            score += 1
        } else {
            alertTitle = "Wrong answer"
            score -= 1
        }

        showAnswerAlert = true
    }

    private func showNextQuestion() {
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
